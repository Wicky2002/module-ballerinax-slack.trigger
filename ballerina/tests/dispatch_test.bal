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
import ballerina/io;
import ballerina/lang.runtime;
import ballerina/test;
import ballerina/time;

const TRIGGER_TEST_SECRET = "trigger-test-secret";
const TRIGGER_TEST_PORT = 9091;
const TRIGGER_PAYLOAD_DIR = "tests/resources/trigger_payloads";

isolated map<boolean> triggerFired = {};
isolated map<json> boundPayloads = {};

listener Listener triggerTestListener = check new ({webhookSecret: TRIGGER_TEST_SECRET}, TRIGGER_TEST_PORT);

final http:Client triggerClient = check new (string `http://localhost:${TRIGGER_TEST_PORT}`);

service AppService on triggerTestListener {
    isolated remote function onAppMention(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppMention"] = true;
        }
        lock {
            boundPayloads["AppService.onAppMention"] = payload.toJson().clone();
        }
    }

    isolated remote function onAppUninstalled(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppUninstalled"] = true;
        }
        lock {
            boundPayloads["AppService.onAppUninstalled"] = payload.toJson().clone();
        }
    }

    isolated remote function onAppContextChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppContextChanged"] = true;
        }
        lock {
            boundPayloads["AppService.onAppContextChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onAppDeleted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppDeleted"] = true;
        }
        lock {
            boundPayloads["AppService.onAppDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onAppHomeOpened(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppHomeOpened"] = true;
        }
        lock {
            boundPayloads["AppService.onAppHomeOpened"] = payload.toJson().clone();
        }
    }

    isolated remote function onAppInstalled(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppInstalled"] = true;
        }
        lock {
            boundPayloads["AppService.onAppInstalled"] = payload.toJson().clone();
        }
    }

    isolated remote function onAppRequested(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppRequested"] = true;
        }
        lock {
            boundPayloads["AppService.onAppRequested"] = payload.toJson().clone();
        }
    }

    isolated remote function onAppUninstalledTeam(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AppService.onAppUninstalledTeam"] = true;
        }
        lock {
            boundPayloads["AppService.onAppUninstalledTeam"] = payload.toJson().clone();
        }
    }
}

service ChannelService on triggerTestListener {
    isolated remote function onChannelArchive(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelArchive"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelArchive"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelCreated(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelCreated"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelDeleted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelDeleted"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelHistoryChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelHistoryChanged"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelHistoryChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelLeft(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelLeft"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelLeft"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelRename(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelRename"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelRename"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelIdChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelIdChanged"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelIdChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelShared(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelShared"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelShared"] = payload.toJson().clone();
        }
    }

    isolated remote function onChannelUnshared(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ChannelService.onChannelUnshared"] = true;
        }
        lock {
            boundPayloads["ChannelService.onChannelUnshared"] = payload.toJson().clone();
        }
    }
}

service DndService on triggerTestListener {
    isolated remote function onDndUpdated(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["DndService.onDndUpdated"] = true;
        }
        lock {
            boundPayloads["DndService.onDndUpdated"] = payload.toJson().clone();
        }
    }

    isolated remote function onDndUpdatedUser(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["DndService.onDndUpdatedUser"] = true;
        }
        lock {
            boundPayloads["DndService.onDndUpdatedUser"] = payload.toJson().clone();
        }
    }
}

service EmailDomainChangedService on triggerTestListener {
    isolated remote function onEmailDomainChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["EmailDomainChangedService.onEmailDomainChanged"] = true;
        }
        lock {
            boundPayloads["EmailDomainChangedService.onEmailDomainChanged"] = payload.toJson().clone();
        }
    }
}

service EmojiChangedService on triggerTestListener {
    isolated remote function onEmojiChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["EmojiChangedService.onEmojiChanged"] = true;
        }
        lock {
            boundPayloads["EmojiChangedService.onEmojiChanged"] = payload.toJson().clone();
        }
    }
}

service FileService on triggerTestListener {
    isolated remote function onFileChange(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FileService.onFileChange"] = true;
        }
        lock {
            boundPayloads["FileService.onFileChange"] = payload.toJson().clone();
        }
    }

    isolated remote function onFileCommentDeleted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FileService.onFileCommentDeleted"] = true;
        }
        lock {
            boundPayloads["FileService.onFileCommentDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onFileCreated(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FileService.onFileCreated"] = true;
        }
        lock {
            boundPayloads["FileService.onFileCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onFileDeleted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FileService.onFileDeleted"] = true;
        }
        lock {
            boundPayloads["FileService.onFileDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onFilePublic(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FileService.onFilePublic"] = true;
        }
        lock {
            boundPayloads["FileService.onFilePublic"] = payload.toJson().clone();
        }
    }

    isolated remote function onFileShared(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FileService.onFileShared"] = true;
        }
        lock {
            boundPayloads["FileService.onFileShared"] = payload.toJson().clone();
        }
    }

    isolated remote function onFileUnshared(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FileService.onFileUnshared"] = true;
        }
        lock {
            boundPayloads["FileService.onFileUnshared"] = payload.toJson().clone();
        }
    }
}

service GridMigrationService on triggerTestListener {
    isolated remote function onGridMigrationFinished(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GridMigrationService.onGridMigrationFinished"] = true;
        }
        lock {
            boundPayloads["GridMigrationService.onGridMigrationFinished"] = payload.toJson().clone();
        }
    }

    isolated remote function onGridMigrationStarted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GridMigrationService.onGridMigrationStarted"] = true;
        }
        lock {
            boundPayloads["GridMigrationService.onGridMigrationStarted"] = payload.toJson().clone();
        }
    }
}

service GroupService on triggerTestListener {
    isolated remote function onGroupClose(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GroupService.onGroupClose"] = true;
        }
        lock {
            boundPayloads["GroupService.onGroupClose"] = payload.toJson().clone();
        }
    }

    isolated remote function onGroupHistoryChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GroupService.onGroupHistoryChanged"] = true;
        }
        lock {
            boundPayloads["GroupService.onGroupHistoryChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onGroupLeft(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GroupService.onGroupLeft"] = true;
        }
        lock {
            boundPayloads["GroupService.onGroupLeft"] = payload.toJson().clone();
        }
    }

    isolated remote function onGroupOpen(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GroupService.onGroupOpen"] = true;
        }
        lock {
            boundPayloads["GroupService.onGroupOpen"] = payload.toJson().clone();
        }
    }

    isolated remote function onGroupRename(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GroupService.onGroupRename"] = true;
        }
        lock {
            boundPayloads["GroupService.onGroupRename"] = payload.toJson().clone();
        }
    }

    isolated remote function onGroupDeleted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["GroupService.onGroupDeleted"] = true;
        }
        lock {
            boundPayloads["GroupService.onGroupDeleted"] = payload.toJson().clone();
        }
    }
}

service ImService on triggerTestListener {
    isolated remote function onImClose(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ImService.onImClose"] = true;
        }
        lock {
            boundPayloads["ImService.onImClose"] = payload.toJson().clone();
        }
    }

    isolated remote function onImCreated(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ImService.onImCreated"] = true;
        }
        lock {
            boundPayloads["ImService.onImCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onImHistoryChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ImService.onImHistoryChanged"] = true;
        }
        lock {
            boundPayloads["ImService.onImHistoryChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onImOpen(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ImService.onImOpen"] = true;
        }
        lock {
            boundPayloads["ImService.onImOpen"] = payload.toJson().clone();
        }
    }
}

service LinkSharedService on triggerTestListener {
    isolated remote function onLinkShared(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["LinkSharedService.onLinkShared"] = true;
        }
        lock {
            boundPayloads["LinkSharedService.onLinkShared"] = payload.toJson().clone();
        }
    }
}

service MemberService on triggerTestListener {
    isolated remote function onMemberJoinedChannel(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["MemberService.onMemberJoinedChannel"] = true;
        }
        lock {
            boundPayloads["MemberService.onMemberJoinedChannel"] = payload.toJson().clone();
        }
    }

    isolated remote function onMemberLeftChannel(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["MemberService.onMemberLeftChannel"] = true;
        }
        lock {
            boundPayloads["MemberService.onMemberLeftChannel"] = payload.toJson().clone();
        }
    }
}

service MessageService on triggerTestListener {
    isolated remote function onMessage(MessageEventWrapper payload) returns error? {
        lock {
            triggerFired["MessageService.onMessage"] = true;
        }
        lock {
            boundPayloads["MessageService.onMessage"] = payload.toJson().clone();
        }
    }

    isolated remote function onMessageMetadataDeleted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["MessageService.onMessageMetadataDeleted"] = true;
        }
        lock {
            boundPayloads["MessageService.onMessageMetadataDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onMessageMetadataPosted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["MessageService.onMessageMetadataPosted"] = true;
        }
        lock {
            boundPayloads["MessageService.onMessageMetadataPosted"] = payload.toJson().clone();
        }
    }

    isolated remote function onMessageMetadataUpdated(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["MessageService.onMessageMetadataUpdated"] = true;
        }
        lock {
            boundPayloads["MessageService.onMessageMetadataUpdated"] = payload.toJson().clone();
        }
    }
}

service PinService on triggerTestListener {
    isolated remote function onPinAdded(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["PinService.onPinAdded"] = true;
        }
        lock {
            boundPayloads["PinService.onPinAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onPinRemoved(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["PinService.onPinRemoved"] = true;
        }
        lock {
            boundPayloads["PinService.onPinRemoved"] = payload.toJson().clone();
        }
    }
}

service ReactionService on triggerTestListener {
    isolated remote function onReactionAdded(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ReactionService.onReactionAdded"] = true;
        }
        lock {
            boundPayloads["ReactionService.onReactionAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onReactionRemoved(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["ReactionService.onReactionRemoved"] = true;
        }
        lock {
            boundPayloads["ReactionService.onReactionRemoved"] = payload.toJson().clone();
        }
    }
}

service StarService on triggerTestListener {
    isolated remote function onStarAdded(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["StarService.onStarAdded"] = true;
        }
        lock {
            boundPayloads["StarService.onStarAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onStarRemoved(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["StarService.onStarRemoved"] = true;
        }
        lock {
            boundPayloads["StarService.onStarRemoved"] = payload.toJson().clone();
        }
    }
}

service SubteamService on triggerTestListener {
    isolated remote function onSubteamCreated(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SubteamService.onSubteamCreated"] = true;
        }
        lock {
            boundPayloads["SubteamService.onSubteamCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onSubteamMembersChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SubteamService.onSubteamMembersChanged"] = true;
        }
        lock {
            boundPayloads["SubteamService.onSubteamMembersChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onSubteamSelfAdded(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SubteamService.onSubteamSelfAdded"] = true;
        }
        lock {
            boundPayloads["SubteamService.onSubteamSelfAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onSubteamSelfRemoved(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SubteamService.onSubteamSelfRemoved"] = true;
        }
        lock {
            boundPayloads["SubteamService.onSubteamSelfRemoved"] = payload.toJson().clone();
        }
    }

    isolated remote function onSubteamUpdated(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SubteamService.onSubteamUpdated"] = true;
        }
        lock {
            boundPayloads["SubteamService.onSubteamUpdated"] = payload.toJson().clone();
        }
    }
}

service TeamService on triggerTestListener {
    isolated remote function onTeamDomainChange(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamDomainChange"] = true;
        }
        lock {
            boundPayloads["TeamService.onTeamDomainChange"] = payload.toJson().clone();
        }
    }

    isolated remote function onTeamJoin(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamJoin"] = true;
        }
        lock {
            boundPayloads["TeamService.onTeamJoin"] = payload.toJson().clone();
        }
    }

    isolated remote function onTeamRename(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamRename"] = true;
        }
        lock {
            boundPayloads["TeamService.onTeamRename"] = payload.toJson().clone();
        }
    }

    isolated remote function onTeamAccessGranted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamAccessGranted"] = true;
        }
        lock {
            boundPayloads["TeamService.onTeamAccessGranted"] = payload.toJson().clone();
        }
    }

    isolated remote function onTeamAccessRevoked(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamAccessRevoked"] = true;
        }
        lock {
            boundPayloads["TeamService.onTeamAccessRevoked"] = payload.toJson().clone();
        }
    }
}

service TokensRevokedService on triggerTestListener {
    isolated remote function onTokensRevoked(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["TokensRevokedService.onTokensRevoked"] = true;
        }
        lock {
            boundPayloads["TokensRevokedService.onTokensRevoked"] = payload.toJson().clone();
        }
    }
}

service UserChangeService on triggerTestListener {
    isolated remote function onUserChange(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["UserChangeService.onUserChange"] = true;
        }
        lock {
            boundPayloads["UserChangeService.onUserChange"] = payload.toJson().clone();
        }
    }
}

service AssistantService on triggerTestListener {
    isolated remote function onAssistantThreadContextChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AssistantService.onAssistantThreadContextChanged"] = true;
        }
        lock {
            boundPayloads["AssistantService.onAssistantThreadContextChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onAssistantThreadStarted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AssistantService.onAssistantThreadStarted"] = true;
        }
        lock {
            boundPayloads["AssistantService.onAssistantThreadStarted"] = payload.toJson().clone();
        }
    }
}

service CallService on triggerTestListener {
    isolated remote function onCallRejected(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["CallService.onCallRejected"] = true;
        }
        lock {
            boundPayloads["CallService.onCallRejected"] = payload.toJson().clone();
        }
    }
}

service EntityService on triggerTestListener {
    isolated remote function onEntityCommentsRequested(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["EntityService.onEntityCommentsRequested"] = true;
        }
        lock {
            boundPayloads["EntityService.onEntityCommentsRequested"] = payload.toJson().clone();
        }
    }

    isolated remote function onEntityDetailsRequested(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["EntityService.onEntityDetailsRequested"] = true;
        }
        lock {
            boundPayloads["EntityService.onEntityDetailsRequested"] = payload.toJson().clone();
        }
    }
}

service FunctionService on triggerTestListener {
    isolated remote function onFunctionExecuted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["FunctionService.onFunctionExecuted"] = true;
        }
        lock {
            boundPayloads["FunctionService.onFunctionExecuted"] = payload.toJson().clone();
        }
    }
}

service InviteService on triggerTestListener {
    isolated remote function onInviteRequested(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["InviteService.onInviteRequested"] = true;
        }
        lock {
            boundPayloads["InviteService.onInviteRequested"] = payload.toJson().clone();
        }
    }
}

service SharedChannelService on triggerTestListener {
    isolated remote function onSharedChannelInviteAccepted(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SharedChannelService.onSharedChannelInviteAccepted"] = true;
        }
        lock {
            boundPayloads["SharedChannelService.onSharedChannelInviteAccepted"] = payload.toJson().clone();
        }
    }

    isolated remote function onSharedChannelInviteApproved(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SharedChannelService.onSharedChannelInviteApproved"] = true;
        }
        lock {
            boundPayloads["SharedChannelService.onSharedChannelInviteApproved"] = payload.toJson().clone();
        }
    }

    isolated remote function onSharedChannelInviteDeclined(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SharedChannelService.onSharedChannelInviteDeclined"] = true;
        }
        lock {
            boundPayloads["SharedChannelService.onSharedChannelInviteDeclined"] = payload.toJson().clone();
        }
    }

    isolated remote function onSharedChannelInviteReceived(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SharedChannelService.onSharedChannelInviteReceived"] = true;
        }
        lock {
            boundPayloads["SharedChannelService.onSharedChannelInviteReceived"] = payload.toJson().clone();
        }
    }

    isolated remote function onSharedChannelInviteRequested(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["SharedChannelService.onSharedChannelInviteRequested"] = true;
        }
        lock {
            boundPayloads["SharedChannelService.onSharedChannelInviteRequested"] = payload.toJson().clone();
        }
    }
}

service UserService on triggerTestListener {
    isolated remote function onUserHuddleChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["UserService.onUserHuddleChanged"] = true;
        }
        lock {
            boundPayloads["UserService.onUserHuddleChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onUserProfileChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["UserService.onUserProfileChanged"] = true;
        }
        lock {
            boundPayloads["UserService.onUserProfileChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onUserStatusChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["UserService.onUserStatusChanged"] = true;
        }
        lock {
            boundPayloads["UserService.onUserStatusChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onUserConnection(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["UserService.onUserConnection"] = true;
        }
        lock {
            boundPayloads["UserService.onUserConnection"] = payload.toJson().clone();
        }
    }

    isolated remote function onUserGuestStatusChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["UserService.onUserGuestStatusChanged"] = true;
        }
        lock {
            boundPayloads["UserService.onUserGuestStatusChanged"] = payload.toJson().clone();
        }
    }
}

service AgentService on triggerTestListener {
    isolated remote function onAgentSessionStopped(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AgentService.onAgentSessionStopped"] = true;
        }
        lock {
            boundPayloads["AgentService.onAgentSessionStopped"] = payload.toJson().clone();
        }
    }

    isolated remote function onAgentSessionTitleChanged(GenericEventWrapper payload) returns error? {
        lock {
            triggerFired["AgentService.onAgentSessionTitleChanged"] = true;
        }
        lock {
            boundPayloads["AgentService.onAgentSessionTitleChanged"] = payload.toJson().clone();
        }
    }
}

isolated function sendSignedTriggerWebhook(string eventIdentifier) returns http:Response|error {
    byte[] body = check io:fileReadBytes(string `${TRIGGER_PAYLOAD_DIR}/${eventIdentifier}.json`);
    return sendSignedTriggerBody(body);
}

isolated function sendSignedTriggerBody(byte[] body) returns http:Response|error {
    string bodyText = check string:fromBytes(body);
    string xSlackRequestTimestampHeaderValue = time:utcNow()[0].toString();
    string payloadToHash = string `v0:${xSlackRequestTimestampHeaderValue}:${bodyText}`;
    byte[] computedDigest = check crypto:hmacSha256(payloadToHash.toBytes(), TRIGGER_TEST_SECRET.toBytes());
    string computedSignature = computedDigest.toBase16();
    map<string> headers = {
        "X-Slack-Request-Timestamp": xSlackRequestTimestampHeaderValue,
        "X-Slack-Signature": string `v0=${computedSignature}`
    };
    return triggerClient->post("/", body, headers, "application/json");
}

function waitForDispatch(string trackerKey) returns boolean {
    foreach int i in 0 ..< 20 {
        lock {
            if triggerFired[trackerKey] ?: false {
                return true;
            }
        }
        runtime:sleep(0.05);
    }
    return false;
}

function boundPayloadOf(string trackerKey) returns map<json> {
    lock {
        json payload = boundPayloads[trackerKey] ?: {};
        return payload is map<json> ? payload.clone() : {};
    }
}

@test:Config {}
function testAppMentionDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_mention");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppMention"), "AppService.onAppMention should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppMention");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAppUninstalledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_uninstalled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppUninstalled"), "AppService.onAppUninstalled should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppUninstalled");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAppContextChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_context_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppContextChanged"), "AppService.onAppContextChanged should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppContextChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAppDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppDeleted"), "AppService.onAppDeleted should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppDeleted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAppHomeOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_home_opened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppHomeOpened"), "AppService.onAppHomeOpened should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppHomeOpened");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAppInstalledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_installed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppInstalled"), "AppService.onAppInstalled should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppInstalled");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAppRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppRequested"), "AppService.onAppRequested should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppRequested");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAppUninstalledTeamDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("app_uninstalled_team");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AppService.onAppUninstalledTeam"), "AppService.onAppUninstalledTeam should have fired");
    map<json> bound = boundPayloadOf("AppService.onAppUninstalledTeam");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelArchiveDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_archive");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelArchive"), "ChannelService.onChannelArchive should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelArchive");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelCreated"), "ChannelService.onChannelCreated should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelCreated");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelDeleted"), "ChannelService.onChannelDeleted should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelDeleted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelHistoryChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_history_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelHistoryChanged"), "ChannelService.onChannelHistoryChanged should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelHistoryChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelLeftDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_left");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelLeft"), "ChannelService.onChannelLeft should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelLeft");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelRenameDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_rename");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelRename"), "ChannelService.onChannelRename should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelRename");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelIdChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_id_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelIdChanged"), "ChannelService.onChannelIdChanged should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelIdChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelSharedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_shared");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelShared"), "ChannelService.onChannelShared should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelShared");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testChannelUnsharedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("channel_unshared");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ChannelService.onChannelUnshared"), "ChannelService.onChannelUnshared should have fired");
    map<json> bound = boundPayloadOf("ChannelService.onChannelUnshared");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testDndUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dnd_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DndService.onDndUpdated"), "DndService.onDndUpdated should have fired");
    map<json> bound = boundPayloadOf("DndService.onDndUpdated");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testDndUpdatedUserDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dnd_updated_user");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DndService.onDndUpdatedUser"), "DndService.onDndUpdatedUser should have fired");
    map<json> bound = boundPayloadOf("DndService.onDndUpdatedUser");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testEmailDomainChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("email_domain_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("EmailDomainChangedService.onEmailDomainChanged"), "EmailDomainChangedService.onEmailDomainChanged should have fired");
    map<json> bound = boundPayloadOf("EmailDomainChangedService.onEmailDomainChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testEmojiChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("emoji_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("EmojiChangedService.onEmojiChanged"), "EmojiChangedService.onEmojiChanged should have fired");
    map<json> bound = boundPayloadOf("EmojiChangedService.onEmojiChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFileChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("file_change");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FileService.onFileChange"), "FileService.onFileChange should have fired");
    map<json> bound = boundPayloadOf("FileService.onFileChange");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFileCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("file_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FileService.onFileCommentDeleted"), "FileService.onFileCommentDeleted should have fired");
    map<json> bound = boundPayloadOf("FileService.onFileCommentDeleted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFileCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("file_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FileService.onFileCreated"), "FileService.onFileCreated should have fired");
    map<json> bound = boundPayloadOf("FileService.onFileCreated");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFileDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("file_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FileService.onFileDeleted"), "FileService.onFileDeleted should have fired");
    map<json> bound = boundPayloadOf("FileService.onFileDeleted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFilePublicDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("file_public");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FileService.onFilePublic"), "FileService.onFilePublic should have fired");
    map<json> bound = boundPayloadOf("FileService.onFilePublic");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFileSharedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("file_shared");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FileService.onFileShared"), "FileService.onFileShared should have fired");
    map<json> bound = boundPayloadOf("FileService.onFileShared");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFileUnsharedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("file_unshared");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FileService.onFileUnshared"), "FileService.onFileUnshared should have fired");
    map<json> bound = boundPayloadOf("FileService.onFileUnshared");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGridMigrationFinishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("grid_migration_finished");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GridMigrationService.onGridMigrationFinished"), "GridMigrationService.onGridMigrationFinished should have fired");
    map<json> bound = boundPayloadOf("GridMigrationService.onGridMigrationFinished");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGridMigrationStartedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("grid_migration_started");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GridMigrationService.onGridMigrationStarted"), "GridMigrationService.onGridMigrationStarted should have fired");
    map<json> bound = boundPayloadOf("GridMigrationService.onGridMigrationStarted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGroupCloseDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("group_close");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GroupService.onGroupClose"), "GroupService.onGroupClose should have fired");
    map<json> bound = boundPayloadOf("GroupService.onGroupClose");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGroupHistoryChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("group_history_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GroupService.onGroupHistoryChanged"), "GroupService.onGroupHistoryChanged should have fired");
    map<json> bound = boundPayloadOf("GroupService.onGroupHistoryChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGroupLeftDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("group_left");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GroupService.onGroupLeft"), "GroupService.onGroupLeft should have fired");
    map<json> bound = boundPayloadOf("GroupService.onGroupLeft");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGroupOpenDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("group_open");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GroupService.onGroupOpen"), "GroupService.onGroupOpen should have fired");
    map<json> bound = boundPayloadOf("GroupService.onGroupOpen");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGroupRenameDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("group_rename");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GroupService.onGroupRename"), "GroupService.onGroupRename should have fired");
    map<json> bound = boundPayloadOf("GroupService.onGroupRename");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testGroupDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("group_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GroupService.onGroupDeleted"), "GroupService.onGroupDeleted should have fired");
    map<json> bound = boundPayloadOf("GroupService.onGroupDeleted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testImCloseDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("im_close");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ImService.onImClose"), "ImService.onImClose should have fired");
    map<json> bound = boundPayloadOf("ImService.onImClose");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testImCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("im_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ImService.onImCreated"), "ImService.onImCreated should have fired");
    map<json> bound = boundPayloadOf("ImService.onImCreated");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testImHistoryChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("im_history_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ImService.onImHistoryChanged"), "ImService.onImHistoryChanged should have fired");
    map<json> bound = boundPayloadOf("ImService.onImHistoryChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testImOpenDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("im_open");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ImService.onImOpen"), "ImService.onImOpen should have fired");
    map<json> bound = boundPayloadOf("ImService.onImOpen");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testLinkSharedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("link_shared");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("LinkSharedService.onLinkShared"), "LinkSharedService.onLinkShared should have fired");
    map<json> bound = boundPayloadOf("LinkSharedService.onLinkShared");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testMemberJoinedChannelDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member_joined_channel");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberJoinedChannel"), "MemberService.onMemberJoinedChannel should have fired");
    map<json> bound = boundPayloadOf("MemberService.onMemberJoinedChannel");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testMemberLeftChannelDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member_left_channel");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberLeftChannel"), "MemberService.onMemberLeftChannel should have fired");
    map<json> bound = boundPayloadOf("MemberService.onMemberLeftChannel");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testMessageDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("message");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MessageService.onMessage"), "MessageService.onMessage should have fired");
    map<json> bound = boundPayloadOf("MessageService.onMessage");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on MessageEventWrapper, not stayed a raw key");
}

@test:Config {}
function testMessageMetadataDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("message_metadata_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MessageService.onMessageMetadataDeleted"), "MessageService.onMessageMetadataDeleted should have fired");
    map<json> bound = boundPayloadOf("MessageService.onMessageMetadataDeleted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testMessageMetadataPostedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("message_metadata_posted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MessageService.onMessageMetadataPosted"), "MessageService.onMessageMetadataPosted should have fired");
    map<json> bound = boundPayloadOf("MessageService.onMessageMetadataPosted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testMessageMetadataUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("message_metadata_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MessageService.onMessageMetadataUpdated"), "MessageService.onMessageMetadataUpdated should have fired");
    map<json> bound = boundPayloadOf("MessageService.onMessageMetadataUpdated");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testPinAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pin_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PinService.onPinAdded"), "PinService.onPinAdded should have fired");
    map<json> bound = boundPayloadOf("PinService.onPinAdded");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testPinRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pin_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PinService.onPinRemoved"), "PinService.onPinRemoved should have fired");
    map<json> bound = boundPayloadOf("PinService.onPinRemoved");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testReactionAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("reaction_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReactionService.onReactionAdded"), "ReactionService.onReactionAdded should have fired");
    map<json> bound = boundPayloadOf("ReactionService.onReactionAdded");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testReactionRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("reaction_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReactionService.onReactionRemoved"), "ReactionService.onReactionRemoved should have fired");
    map<json> bound = boundPayloadOf("ReactionService.onReactionRemoved");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testStarAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StarService.onStarAdded"), "StarService.onStarAdded should have fired");
    map<json> bound = boundPayloadOf("StarService.onStarAdded");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testStarRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StarService.onStarRemoved"), "StarService.onStarRemoved should have fired");
    map<json> bound = boundPayloadOf("StarService.onStarRemoved");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSubteamCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("subteam_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubteamService.onSubteamCreated"), "SubteamService.onSubteamCreated should have fired");
    map<json> bound = boundPayloadOf("SubteamService.onSubteamCreated");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSubteamMembersChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("subteam_members_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubteamService.onSubteamMembersChanged"), "SubteamService.onSubteamMembersChanged should have fired");
    map<json> bound = boundPayloadOf("SubteamService.onSubteamMembersChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSubteamSelfAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("subteam_self_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubteamService.onSubteamSelfAdded"), "SubteamService.onSubteamSelfAdded should have fired");
    map<json> bound = boundPayloadOf("SubteamService.onSubteamSelfAdded");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSubteamSelfRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("subteam_self_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubteamService.onSubteamSelfRemoved"), "SubteamService.onSubteamSelfRemoved should have fired");
    map<json> bound = boundPayloadOf("SubteamService.onSubteamSelfRemoved");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSubteamUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("subteam_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubteamService.onSubteamUpdated"), "SubteamService.onSubteamUpdated should have fired");
    map<json> bound = boundPayloadOf("SubteamService.onSubteamUpdated");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testTeamDomainChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_domain_change");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamDomainChange"), "TeamService.onTeamDomainChange should have fired");
    map<json> bound = boundPayloadOf("TeamService.onTeamDomainChange");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testTeamJoinDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_join");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamJoin"), "TeamService.onTeamJoin should have fired");
    map<json> bound = boundPayloadOf("TeamService.onTeamJoin");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testTeamRenameDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_rename");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamRename"), "TeamService.onTeamRename should have fired");
    map<json> bound = boundPayloadOf("TeamService.onTeamRename");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testTeamAccessGrantedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_access_granted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamAccessGranted"), "TeamService.onTeamAccessGranted should have fired");
    map<json> bound = boundPayloadOf("TeamService.onTeamAccessGranted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testTeamAccessRevokedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_access_revoked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamAccessRevoked"), "TeamService.onTeamAccessRevoked should have fired");
    map<json> bound = boundPayloadOf("TeamService.onTeamAccessRevoked");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testTokensRevokedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("tokens_revoked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TokensRevokedService.onTokensRevoked"), "TokensRevokedService.onTokensRevoked should have fired");
    map<json> bound = boundPayloadOf("TokensRevokedService.onTokensRevoked");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testUserChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("user_change");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("UserChangeService.onUserChange"), "UserChangeService.onUserChange should have fired");
    map<json> bound = boundPayloadOf("UserChangeService.onUserChange");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAssistantThreadContextChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("assistant_thread_context_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AssistantService.onAssistantThreadContextChanged"), "AssistantService.onAssistantThreadContextChanged should have fired");
    map<json> bound = boundPayloadOf("AssistantService.onAssistantThreadContextChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAssistantThreadStartedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("assistant_thread_started");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AssistantService.onAssistantThreadStarted"), "AssistantService.onAssistantThreadStarted should have fired");
    map<json> bound = boundPayloadOf("AssistantService.onAssistantThreadStarted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testCallRejectedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("call_rejected");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CallService.onCallRejected"), "CallService.onCallRejected should have fired");
    map<json> bound = boundPayloadOf("CallService.onCallRejected");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testEntityCommentsRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("entity_comments_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("EntityService.onEntityCommentsRequested"), "EntityService.onEntityCommentsRequested should have fired");
    map<json> bound = boundPayloadOf("EntityService.onEntityCommentsRequested");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testEntityDetailsRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("entity_details_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("EntityService.onEntityDetailsRequested"), "EntityService.onEntityDetailsRequested should have fired");
    map<json> bound = boundPayloadOf("EntityService.onEntityDetailsRequested");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testFunctionExecutedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("function_executed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("FunctionService.onFunctionExecuted"), "FunctionService.onFunctionExecuted should have fired");
    map<json> bound = boundPayloadOf("FunctionService.onFunctionExecuted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testInviteRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("invite_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InviteService.onInviteRequested"), "InviteService.onInviteRequested should have fired");
    map<json> bound = boundPayloadOf("InviteService.onInviteRequested");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSharedChannelInviteAcceptedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("shared_channel_invite_accepted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SharedChannelService.onSharedChannelInviteAccepted"), "SharedChannelService.onSharedChannelInviteAccepted should have fired");
    map<json> bound = boundPayloadOf("SharedChannelService.onSharedChannelInviteAccepted");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSharedChannelInviteApprovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("shared_channel_invite_approved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SharedChannelService.onSharedChannelInviteApproved"), "SharedChannelService.onSharedChannelInviteApproved should have fired");
    map<json> bound = boundPayloadOf("SharedChannelService.onSharedChannelInviteApproved");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSharedChannelInviteDeclinedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("shared_channel_invite_declined");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SharedChannelService.onSharedChannelInviteDeclined"), "SharedChannelService.onSharedChannelInviteDeclined should have fired");
    map<json> bound = boundPayloadOf("SharedChannelService.onSharedChannelInviteDeclined");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSharedChannelInviteReceivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("shared_channel_invite_received");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SharedChannelService.onSharedChannelInviteReceived"), "SharedChannelService.onSharedChannelInviteReceived should have fired");
    map<json> bound = boundPayloadOf("SharedChannelService.onSharedChannelInviteReceived");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testSharedChannelInviteRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("shared_channel_invite_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SharedChannelService.onSharedChannelInviteRequested"), "SharedChannelService.onSharedChannelInviteRequested should have fired");
    map<json> bound = boundPayloadOf("SharedChannelService.onSharedChannelInviteRequested");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testUserHuddleChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("user_huddle_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("UserService.onUserHuddleChanged"), "UserService.onUserHuddleChanged should have fired");
    map<json> bound = boundPayloadOf("UserService.onUserHuddleChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testUserProfileChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("user_profile_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("UserService.onUserProfileChanged"), "UserService.onUserProfileChanged should have fired");
    map<json> bound = boundPayloadOf("UserService.onUserProfileChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testUserStatusChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("user_status_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("UserService.onUserStatusChanged"), "UserService.onUserStatusChanged should have fired");
    map<json> bound = boundPayloadOf("UserService.onUserStatusChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testUserConnectionDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("user_connection");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("UserService.onUserConnection"), "UserService.onUserConnection should have fired");
    map<json> bound = boundPayloadOf("UserService.onUserConnection");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testUserGuestStatusChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("user_guest_status_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("UserService.onUserGuestStatusChanged"), "UserService.onUserGuestStatusChanged should have fired");
    map<json> bound = boundPayloadOf("UserService.onUserGuestStatusChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAgentSessionStoppedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("agent_session_stopped");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AgentService.onAgentSessionStopped"), "AgentService.onAgentSessionStopped should have fired");
    map<json> bound = boundPayloadOf("AgentService.onAgentSessionStopped");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testAgentSessionTitleChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("agent_session_title_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("AgentService.onAgentSessionTitleChanged"), "AgentService.onAgentSessionTitleChanged should have fired");
    map<json> bound = boundPayloadOf("AgentService.onAgentSessionTitleChanged");
    test:assertFalse(bound.hasKey("api_app_id"), "'api_app_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_id"), "'event_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_time"), "'event_time' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("team_id"), "'team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("event_context"), "'event_context' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("is_ext_shared_channel"), "'is_ext_shared_channel' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_team_id"), "'context_team_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("context_enterprise_id"), "'context_enterprise_id' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
    test:assertFalse(bound.hasKey("authed_users"), "'authed_users' should have bound to its camelCase field on GenericEventWrapper, not stayed a raw key");
}

@test:Config {}
function testVerificationHandshake() returns error? {
    json handshake = {"type": "url_verification", "challenge": "trigger-test-challenge"};
    http:Response response = check sendSignedTriggerBody(handshake.toJsonString().toBytes());
    test:assertEquals(response.statusCode, 200);
    test:assertEquals(check response.getTextPayload(), "trigger-test-challenge");
}

