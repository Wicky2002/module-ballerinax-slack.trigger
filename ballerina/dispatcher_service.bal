// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/crypto;
import ballerina/http;
import ballerina/log;
import ballerina/time;
import ballerinax/asyncapi.native.handler;

service class DispatcherService {
    *http:Service;
    private map<GenericServiceType> services = {};
    private handler:NativeHandler nativeHandler = new ();
    private string? webhookSecret;

    isolated function init(string? webhookSecret) {
        self.webhookSecret = webhookSecret;
    }

    isolated function addServiceRef(string serviceType, GenericServiceType genericService) returns error? {
        if (self.services.hasKey(serviceType)) {
            return error(string `Service of type ${serviceType} has already been attached`);
        }
        self.services[serviceType] = genericService;
    }

    isolated function removeServiceRef(string serviceType) returns error? {
        if (!self.services.hasKey(serviceType)) {
            return error(string `Cannot detach the service of type ${serviceType}. Service has not been attached to the listener before`);
        }
        _ = self.services.remove(serviceType);
    }

    resource function post .(http:Caller caller, http:Request request) returns error? {
        error? verifyResult = self.verifyWebhookSignature(request, self.webhookSecret);
        if verifyResult is error {
            string reason = verifyResult.message().startsWith("Unauthorized:") ? verifyResult.message() : "Unauthorized: Malformed Request";
            log:printWarn("WEBHOOK_SIGNATURE_REJECTED", reason = reason, path = request.rawPath);
            http:Response r = new;
            r.statusCode = http:STATUS_UNAUTHORIZED;
            check caller->respond(r);
            return;
        }
        json payload = check request.getJsonPayload();
        json|error handshakeMarker = payload.'type;
        if handshakeMarker is json && handshakeMarker == "url_verification" {
            json|error challenge = payload.challenge;
            http:Response handshakeResponse = new;
            if challenge is json && challenge != () {
                handshakeResponse.setTextPayload(challenge.toString());
            } else {
                handshakeResponse.statusCode = http:STATUS_BAD_REQUEST;
            }
            check caller->respond(handshakeResponse);
            return;
        }
        string eventType = (check payload.event.'type).toString();
        http:Response ackResponse = new;
        ackResponse.statusCode = http:STATUS_OK;
        check caller->respond(ackResponse);
        boolean|error dispatchResult = self.matchRemoteFunc(payload, eventType);
        if dispatchResult is error {
            log:printError("DISPATCH_FAILED", dispatchResult);
        } else if !dispatchResult {
            log:printWarn("NO_HANDLER_FOR_EVENT", eventIdentifier = eventType);
        }
    }

    private isolated function verifyWebhookSignature(http:Request request, string? webhookSecret) returns error? {
        if webhookSecret is () || webhookSecret.trim() == "" {
            return error("Unauthorized: Webhook Secret Not Configured");
        }
        if !request.hasHeader("X-Slack-Request-Timestamp") {
            return error("Unauthorized: Missing Freshness Header");
        }
        string freshnessHeaderValue = check request.getHeader("X-Slack-Request-Timestamp");
        decimal freshnessTimestamp;
        do {
            freshnessTimestamp = check decimal:fromString(freshnessHeaderValue);
        } on fail {
            return error("Unauthorized: Invalid Freshness Header");
        }
        freshnessTimestamp = freshnessTimestamp * 1000;
        decimal freshnessNowMillis = <decimal>time:utcNow()[0] * 1000;
        decimal freshnessSkewMillis = freshnessNowMillis - freshnessTimestamp;
        if freshnessSkewMillis.abs() > 300000d {
            return error("Unauthorized: Request Timestamp Expired");
        }
        if !request.hasHeader("X-Slack-Signature") {
            return error("Unauthorized: Missing Signature Header");
        }
        string receivedHeader = check request.getHeader("X-Slack-Signature");
        map<string> extractedHeaderValues = {};
        int headerCursor = 0;
        if !receivedHeader.substring(headerCursor).startsWith("v0=") {
            return error("Unauthorized: Malformed Signature Header");
        }
        headerCursor += 3;
        extractedHeaderValues["signature"] = receivedHeader.substring(headerCursor);
        headerCursor = receivedHeader.length();
        if !extractedHeaderValues.hasKey("signature") {
            return error("Unauthorized: Missing Header Component: signature");
        }
        string payloadToHash = string `v0:${check request.getHeader("X-Slack-Request-Timestamp")}:${check request.getTextPayload()}`;
        byte[] computedDigest = check crypto:hmacSha256(payloadToHash.toBytes(), webhookSecret.toBytes());
        string computedSignature = computedDigest.toBase16();
        string expectedHeader = string `v0=${computedSignature}`;
        if !crypto:equalConstantTime(receivedHeader.toBytes(), expectedHeader.toBytes()) {
            return error("Unauthorized: Signature Mismatch");
        }
    }

    private isolated function matchRemoteFunc(json payload, string eventType) returns boolean|error {
        if check self.matchRemoteFuncForApp(payload) {
            return true;
        }
        if check self.matchRemoteFuncForChannel(payload) {
            return true;
        }
        if check self.matchRemoteFuncForDnd(payload) {
            return true;
        }
        if check self.matchRemoteFuncForEmailDomainChanged(payload) {
            return true;
        }
        if check self.matchRemoteFuncForEmojiChanged(payload) {
            return true;
        }
        if check self.matchRemoteFuncForFile(payload) {
            return true;
        }
        if check self.matchRemoteFuncForGridMigration(payload) {
            return true;
        }
        if check self.matchRemoteFuncForGroup(payload) {
            return true;
        }
        if check self.matchRemoteFuncForIm(payload) {
            return true;
        }
        if check self.matchRemoteFuncForLinkShared(payload) {
            return true;
        }
        if check self.matchRemoteFuncForMember(payload) {
            return true;
        }
        if check self.matchRemoteFuncForMessage(payload) {
            return true;
        }
        if check self.matchRemoteFuncForPin(payload) {
            return true;
        }
        if check self.matchRemoteFuncForReaction(payload) {
            return true;
        }
        if check self.matchRemoteFuncForStar(payload) {
            return true;
        }
        if check self.matchRemoteFuncForSubteam(payload) {
            return true;
        }
        if check self.matchRemoteFuncForTeam(payload) {
            return true;
        }
        if check self.matchRemoteFuncForTokensRevoked(payload) {
            return true;
        }
        if check self.matchRemoteFuncForUserChange(payload) {
            return true;
        }
        if check self.matchRemoteFuncForAssistant(payload) {
            return true;
        }
        if check self.matchRemoteFuncForCall(payload) {
            return true;
        }
        if check self.matchRemoteFuncForEntity(payload) {
            return true;
        }
        if check self.matchRemoteFuncForFunction(payload) {
            return true;
        }
        if check self.matchRemoteFuncForInvite(payload) {
            return true;
        }
        if check self.matchRemoteFuncForSharedChannel(payload) {
            return true;
        }
        if check self.matchRemoteFuncForUser(payload) {
            return true;
        }
        if check self.matchRemoteFuncForAgent(payload) {
            return true;
        }
        return false;
    }

    private isolated function matchRemoteFuncForApp(json payload) returns boolean|error {
        match payload.event.'type {
            "app_mention" => {
                check self.executeRemoteFunc(payload, "app_mention", "AppService", "onAppMention");
                return true;
            }
            "app_uninstalled" => {
                check self.executeRemoteFunc(payload, "app_uninstalled", "AppService", "onAppUninstalled");
                return true;
            }
            "app_context_changed" => {
                check self.executeRemoteFunc(payload, "app_context_changed", "AppService", "onAppContextChanged");
                return true;
            }
            "app_deleted" => {
                check self.executeRemoteFunc(payload, "app_deleted", "AppService", "onAppDeleted");
                return true;
            }
            "app_home_opened" => {
                check self.executeRemoteFunc(payload, "app_home_opened", "AppService", "onAppHomeOpened");
                return true;
            }
            "app_installed" => {
                check self.executeRemoteFunc(payload, "app_installed", "AppService", "onAppInstalled");
                return true;
            }
            "app_requested" => {
                check self.executeRemoteFunc(payload, "app_requested", "AppService", "onAppRequested");
                return true;
            }
            "app_uninstalled_team" => {
                check self.executeRemoteFunc(payload, "app_uninstalled_team", "AppService", "onAppUninstalledTeam");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForChannel(json payload) returns boolean|error {
        match payload.event.'type {
            "channel_archive" => {
                check self.executeRemoteFunc(payload, "channel_archive", "ChannelService", "onChannelArchive");
                return true;
            }
            "channel_created" => {
                check self.executeRemoteFunc(payload, "channel_created", "ChannelService", "onChannelCreated");
                return true;
            }
            "channel_deleted" => {
                check self.executeRemoteFunc(payload, "channel_deleted", "ChannelService", "onChannelDeleted");
                return true;
            }
            "channel_history_changed" => {
                check self.executeRemoteFunc(payload, "channel_history_changed", "ChannelService", "onChannelHistoryChanged");
                return true;
            }
            "channel_left" => {
                check self.executeRemoteFunc(payload, "channel_left", "ChannelService", "onChannelLeft");
                return true;
            }
            "channel_rename" => {
                check self.executeRemoteFunc(payload, "channel_rename", "ChannelService", "onChannelRename");
                return true;
            }
            "channel_id_changed" => {
                check self.executeRemoteFunc(payload, "channel_id_changed", "ChannelService", "onChannelIdChanged");
                return true;
            }
            "channel_shared" => {
                check self.executeRemoteFunc(payload, "channel_shared", "ChannelService", "onChannelShared");
                return true;
            }
            "channel_unshared" => {
                check self.executeRemoteFunc(payload, "channel_unshared", "ChannelService", "onChannelUnshared");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDnd(json payload) returns boolean|error {
        match payload.event.'type {
            "dnd_updated" => {
                check self.executeRemoteFunc(payload, "dnd_updated", "DndService", "onDndUpdated");
                return true;
            }
            "dnd_updated_user" => {
                check self.executeRemoteFunc(payload, "dnd_updated_user", "DndService", "onDndUpdatedUser");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForEmailDomainChanged(json payload) returns boolean|error {
        match payload.event.'type {
            "email_domain_changed" => {
                check self.executeRemoteFunc(payload, "email_domain_changed", "EmailDomainChangedService", "onEmailDomainChanged");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForEmojiChanged(json payload) returns boolean|error {
        match payload.event.'type {
            "emoji_changed" => {
                check self.executeRemoteFunc(payload, "emoji_changed", "EmojiChangedService", "onEmojiChanged");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForFile(json payload) returns boolean|error {
        match payload.event.'type {
            "file_change" => {
                check self.executeRemoteFunc(payload, "file_change", "FileService", "onFileChange");
                return true;
            }
            "file_comment_deleted" => {
                check self.executeRemoteFunc(payload, "file_comment_deleted", "FileService", "onFileCommentDeleted");
                return true;
            }
            "file_created" => {
                check self.executeRemoteFunc(payload, "file_created", "FileService", "onFileCreated");
                return true;
            }
            "file_deleted" => {
                check self.executeRemoteFunc(payload, "file_deleted", "FileService", "onFileDeleted");
                return true;
            }
            "file_public" => {
                check self.executeRemoteFunc(payload, "file_public", "FileService", "onFilePublic");
                return true;
            }
            "file_shared" => {
                check self.executeRemoteFunc(payload, "file_shared", "FileService", "onFileShared");
                return true;
            }
            "file_unshared" => {
                check self.executeRemoteFunc(payload, "file_unshared", "FileService", "onFileUnshared");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForGridMigration(json payload) returns boolean|error {
        match payload.event.'type {
            "grid_migration_finished" => {
                check self.executeRemoteFunc(payload, "grid_migration_finished", "GridMigrationService", "onGridMigrationFinished");
                return true;
            }
            "grid_migration_started" => {
                check self.executeRemoteFunc(payload, "grid_migration_started", "GridMigrationService", "onGridMigrationStarted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForGroup(json payload) returns boolean|error {
        match payload.event.'type {
            "group_close" => {
                check self.executeRemoteFunc(payload, "group_close", "GroupService", "onGroupClose");
                return true;
            }
            "group_history_changed" => {
                check self.executeRemoteFunc(payload, "group_history_changed", "GroupService", "onGroupHistoryChanged");
                return true;
            }
            "group_left" => {
                check self.executeRemoteFunc(payload, "group_left", "GroupService", "onGroupLeft");
                return true;
            }
            "group_open" => {
                check self.executeRemoteFunc(payload, "group_open", "GroupService", "onGroupOpen");
                return true;
            }
            "group_rename" => {
                check self.executeRemoteFunc(payload, "group_rename", "GroupService", "onGroupRename");
                return true;
            }
            "group_deleted" => {
                check self.executeRemoteFunc(payload, "group_deleted", "GroupService", "onGroupDeleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForIm(json payload) returns boolean|error {
        match payload.event.'type {
            "im_close" => {
                check self.executeRemoteFunc(payload, "im_close", "ImService", "onImClose");
                return true;
            }
            "im_created" => {
                check self.executeRemoteFunc(payload, "im_created", "ImService", "onImCreated");
                return true;
            }
            "im_history_changed" => {
                check self.executeRemoteFunc(payload, "im_history_changed", "ImService", "onImHistoryChanged");
                return true;
            }
            "im_open" => {
                check self.executeRemoteFunc(payload, "im_open", "ImService", "onImOpen");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForLinkShared(json payload) returns boolean|error {
        match payload.event.'type {
            "link_shared" => {
                check self.executeRemoteFunc(payload, "link_shared", "LinkSharedService", "onLinkShared");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMember(json payload) returns boolean|error {
        match payload.event.'type {
            "member_joined_channel" => {
                check self.executeRemoteFunc(payload, "member_joined_channel", "MemberService", "onMemberJoinedChannel");
                return true;
            }
            "member_left_channel" => {
                check self.executeRemoteFunc(payload, "member_left_channel", "MemberService", "onMemberLeftChannel");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMessage(json payload) returns boolean|error {
        match payload.event.'type {
            "message" => {
                check self.executeRemoteFunc(payload, "message", "MessageService", "onMessage");
                return true;
            }
            "message_metadata_deleted" => {
                check self.executeRemoteFunc(payload, "message_metadata_deleted", "MessageService", "onMessageMetadataDeleted");
                return true;
            }
            "message_metadata_posted" => {
                check self.executeRemoteFunc(payload, "message_metadata_posted", "MessageService", "onMessageMetadataPosted");
                return true;
            }
            "message_metadata_updated" => {
                check self.executeRemoteFunc(payload, "message_metadata_updated", "MessageService", "onMessageMetadataUpdated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPin(json payload) returns boolean|error {
        match payload.event.'type {
            "pin_added" => {
                check self.executeRemoteFunc(payload, "pin_added", "PinService", "onPinAdded");
                return true;
            }
            "pin_removed" => {
                check self.executeRemoteFunc(payload, "pin_removed", "PinService", "onPinRemoved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForReaction(json payload) returns boolean|error {
        match payload.event.'type {
            "reaction_added" => {
                check self.executeRemoteFunc(payload, "reaction_added", "ReactionService", "onReactionAdded");
                return true;
            }
            "reaction_removed" => {
                check self.executeRemoteFunc(payload, "reaction_removed", "ReactionService", "onReactionRemoved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForStar(json payload) returns boolean|error {
        match payload.event.'type {
            "star_added" => {
                check self.executeRemoteFunc(payload, "star_added", "StarService", "onStarAdded");
                return true;
            }
            "star_removed" => {
                check self.executeRemoteFunc(payload, "star_removed", "StarService", "onStarRemoved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSubteam(json payload) returns boolean|error {
        match payload.event.'type {
            "subteam_created" => {
                check self.executeRemoteFunc(payload, "subteam_created", "SubteamService", "onSubteamCreated");
                return true;
            }
            "subteam_members_changed" => {
                check self.executeRemoteFunc(payload, "subteam_members_changed", "SubteamService", "onSubteamMembersChanged");
                return true;
            }
            "subteam_self_added" => {
                check self.executeRemoteFunc(payload, "subteam_self_added", "SubteamService", "onSubteamSelfAdded");
                return true;
            }
            "subteam_self_removed" => {
                check self.executeRemoteFunc(payload, "subteam_self_removed", "SubteamService", "onSubteamSelfRemoved");
                return true;
            }
            "subteam_updated" => {
                check self.executeRemoteFunc(payload, "subteam_updated", "SubteamService", "onSubteamUpdated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForTeam(json payload) returns boolean|error {
        match payload.event.'type {
            "team_domain_change" => {
                check self.executeRemoteFunc(payload, "team_domain_change", "TeamService", "onTeamDomainChange");
                return true;
            }
            "team_join" => {
                check self.executeRemoteFunc(payload, "team_join", "TeamService", "onTeamJoin");
                return true;
            }
            "team_rename" => {
                check self.executeRemoteFunc(payload, "team_rename", "TeamService", "onTeamRename");
                return true;
            }
            "team_access_granted" => {
                check self.executeRemoteFunc(payload, "team_access_granted", "TeamService", "onTeamAccessGranted");
                return true;
            }
            "team_access_revoked" => {
                check self.executeRemoteFunc(payload, "team_access_revoked", "TeamService", "onTeamAccessRevoked");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForTokensRevoked(json payload) returns boolean|error {
        match payload.event.'type {
            "tokens_revoked" => {
                check self.executeRemoteFunc(payload, "tokens_revoked", "TokensRevokedService", "onTokensRevoked");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForUserChange(json payload) returns boolean|error {
        match payload.event.'type {
            "user_change" => {
                check self.executeRemoteFunc(payload, "user_change", "UserChangeService", "onUserChange");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForAssistant(json payload) returns boolean|error {
        match payload.event.'type {
            "assistant_thread_context_changed" => {
                check self.executeRemoteFunc(payload, "assistant_thread_context_changed", "AssistantService", "onAssistantThreadContextChanged");
                return true;
            }
            "assistant_thread_started" => {
                check self.executeRemoteFunc(payload, "assistant_thread_started", "AssistantService", "onAssistantThreadStarted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCall(json payload) returns boolean|error {
        match payload.event.'type {
            "call_rejected" => {
                check self.executeRemoteFunc(payload, "call_rejected", "CallService", "onCallRejected");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForEntity(json payload) returns boolean|error {
        match payload.event.'type {
            "entity_comments_requested" => {
                check self.executeRemoteFunc(payload, "entity_comments_requested", "EntityService", "onEntityCommentsRequested");
                return true;
            }
            "entity_details_requested" => {
                check self.executeRemoteFunc(payload, "entity_details_requested", "EntityService", "onEntityDetailsRequested");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForFunction(json payload) returns boolean|error {
        match payload.event.'type {
            "function_executed" => {
                check self.executeRemoteFunc(payload, "function_executed", "FunctionService", "onFunctionExecuted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForInvite(json payload) returns boolean|error {
        match payload.event.'type {
            "invite_requested" => {
                check self.executeRemoteFunc(payload, "invite_requested", "InviteService", "onInviteRequested");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSharedChannel(json payload) returns boolean|error {
        match payload.event.'type {
            "shared_channel_invite_accepted" => {
                check self.executeRemoteFunc(payload, "shared_channel_invite_accepted", "SharedChannelService", "onSharedChannelInviteAccepted");
                return true;
            }
            "shared_channel_invite_approved" => {
                check self.executeRemoteFunc(payload, "shared_channel_invite_approved", "SharedChannelService", "onSharedChannelInviteApproved");
                return true;
            }
            "shared_channel_invite_declined" => {
                check self.executeRemoteFunc(payload, "shared_channel_invite_declined", "SharedChannelService", "onSharedChannelInviteDeclined");
                return true;
            }
            "shared_channel_invite_received" => {
                check self.executeRemoteFunc(payload, "shared_channel_invite_received", "SharedChannelService", "onSharedChannelInviteReceived");
                return true;
            }
            "shared_channel_invite_requested" => {
                check self.executeRemoteFunc(payload, "shared_channel_invite_requested", "SharedChannelService", "onSharedChannelInviteRequested");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForUser(json payload) returns boolean|error {
        match payload.event.'type {
            "user_huddle_changed" => {
                check self.executeRemoteFunc(payload, "user_huddle_changed", "UserService", "onUserHuddleChanged");
                return true;
            }
            "user_profile_changed" => {
                check self.executeRemoteFunc(payload, "user_profile_changed", "UserService", "onUserProfileChanged");
                return true;
            }
            "user_status_changed" => {
                check self.executeRemoteFunc(payload, "user_status_changed", "UserService", "onUserStatusChanged");
                return true;
            }
            "user_connection" => {
                check self.executeRemoteFunc(payload, "user_connection", "UserService", "onUserConnection");
                return true;
            }
            "user_guest_status_changed" => {
                check self.executeRemoteFunc(payload, "user_guest_status_changed", "UserService", "onUserGuestStatusChanged");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForAgent(json payload) returns boolean|error {
        match payload.event.'type {
            "agent_session_stopped" => {
                check self.executeRemoteFunc(payload, "agent_session_stopped", "AgentService", "onAgentSessionStopped");
                return true;
            }
            "agent_session_title_changed" => {
                check self.executeRemoteFunc(payload, "agent_session_title_changed", "AgentService", "onAgentSessionTitleChanged");
                return true;
            }
        }
        return false;
    }

    private isolated function executeRemoteFunc(json payload, string eventName, string serviceTypeStr, string eventFunction) returns error? {
        GenericServiceType? genericService = self.services[serviceTypeStr];
        if genericService is GenericServiceType {
            any boundEvent = check self.nativeHandler.bindEventPayload(genericService, eventFunction, payload);
            check self.nativeHandler.invokeRemoteFunction(boundEvent, eventName, eventFunction, genericService);
        } else {
            log:printDebug("SERVICE_NOT_ATTACHED", serviceType = serviceTypeStr, eventName = eventName);
        }
    }
}
