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

# Attachable service type exposing the AppService family of webhook events.
public type AppService service object {
    # Triggered on App mention.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppMention(GenericEventWrapper payload) returns error?;

    # Triggered on App uninstalled.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppUninstalled(GenericEventWrapper payload) returns error?;

    # Triggered on App context changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppContextChanged(GenericEventWrapper payload) returns error?;

    # Triggered on App deleted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppDeleted(GenericEventWrapper payload) returns error?;

    # Triggered on App home opened.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppHomeOpened(GenericEventWrapper payload) returns error?;

    # Triggered on App installed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppInstalled(GenericEventWrapper payload) returns error?;

    # Triggered on App requested.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppRequested(GenericEventWrapper payload) returns error?;

    # Triggered on App uninstalled team.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAppUninstalledTeam(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the ChannelService family of webhook events.
public type ChannelService service object {
    # Triggered on Channel archive.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelArchive(GenericEventWrapper payload) returns error?;

    # Triggered on Channel created.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelCreated(GenericEventWrapper payload) returns error?;

    # Triggered on Channel deleted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelDeleted(GenericEventWrapper payload) returns error?;

    # Triggered on Channel history changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelHistoryChanged(GenericEventWrapper payload) returns error?;

    # Triggered on Channel left.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelLeft(GenericEventWrapper payload) returns error?;

    # Triggered on Channel rename.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelRename(GenericEventWrapper payload) returns error?;

    # Triggered on Channel id changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelIdChanged(GenericEventWrapper payload) returns error?;

    # Triggered on Channel shared.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelShared(GenericEventWrapper payload) returns error?;

    # Triggered on Channel unshared.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onChannelUnshared(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the DndService family of webhook events.
public type DndService service object {
    # Triggered on Dnd updated.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onDndUpdated(GenericEventWrapper payload) returns error?;

    # Triggered on Dnd updated user.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onDndUpdatedUser(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the EmailDomainChangedService family of webhook events.
public type EmailDomainChangedService service object {
    # Triggered on Email domain changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onEmailDomainChanged(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the EmojiChangedService family of webhook events.
public type EmojiChangedService service object {
    # Triggered on Emoji changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onEmojiChanged(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the FileService family of webhook events.
public type FileService service object {
    # Triggered on File change.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFileChange(GenericEventWrapper payload) returns error?;

    # Triggered on File comment deleted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFileCommentDeleted(GenericEventWrapper payload) returns error?;

    # Triggered on File created.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFileCreated(GenericEventWrapper payload) returns error?;

    # Triggered on File deleted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFileDeleted(GenericEventWrapper payload) returns error?;

    # Triggered on File public.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFilePublic(GenericEventWrapper payload) returns error?;

    # Triggered on File shared.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFileShared(GenericEventWrapper payload) returns error?;

    # Triggered on File unshared.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFileUnshared(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the GridMigrationService family of webhook events.
public type GridMigrationService service object {
    # Triggered on Grid migration finished.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGridMigrationFinished(GenericEventWrapper payload) returns error?;

    # Triggered on Grid migration started.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGridMigrationStarted(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the GroupService family of webhook events.
public type GroupService service object {
    # Triggered on Group close.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGroupClose(GenericEventWrapper payload) returns error?;

    # Triggered on Group history changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGroupHistoryChanged(GenericEventWrapper payload) returns error?;

    # Triggered on Group left.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGroupLeft(GenericEventWrapper payload) returns error?;

    # Triggered on Group open.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGroupOpen(GenericEventWrapper payload) returns error?;

    # Triggered on Group rename.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGroupRename(GenericEventWrapper payload) returns error?;

    # Triggered on Group deleted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onGroupDeleted(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the ImService family of webhook events.
public type ImService service object {
    # Triggered on Im close.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onImClose(GenericEventWrapper payload) returns error?;

    # Triggered on Im created.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onImCreated(GenericEventWrapper payload) returns error?;

    # Triggered on Im history changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onImHistoryChanged(GenericEventWrapper payload) returns error?;

    # Triggered on Im open.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onImOpen(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the LinkSharedService family of webhook events.
public type LinkSharedService service object {
    # Triggered on Link shared.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onLinkShared(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the MemberService family of webhook events.
public type MemberService service object {
    # Triggered on Member joined channel.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onMemberJoinedChannel(GenericEventWrapper payload) returns error?;

    # Triggered on Member left channel.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onMemberLeftChannel(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the MessageService family of webhook events.
public type MessageService service object {
    # Triggered on Message.
    # + payload - the MessageEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onMessage(MessageEventWrapper payload) returns error?;

    # Triggered on Message metadata deleted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onMessageMetadataDeleted(GenericEventWrapper payload) returns error?;

    # Triggered on Message metadata posted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onMessageMetadataPosted(GenericEventWrapper payload) returns error?;

    # Triggered on Message metadata updated.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onMessageMetadataUpdated(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the PinService family of webhook events.
public type PinService service object {
    # Triggered on Pin added.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onPinAdded(GenericEventWrapper payload) returns error?;

    # Triggered on Pin removed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onPinRemoved(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the ReactionService family of webhook events.
public type ReactionService service object {
    # Triggered on Reaction added.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onReactionAdded(GenericEventWrapper payload) returns error?;

    # Triggered on Reaction removed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onReactionRemoved(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the StarService family of webhook events.
public type StarService service object {
    # Triggered on Star added.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onStarAdded(GenericEventWrapper payload) returns error?;

    # Triggered on Star removed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onStarRemoved(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the SubteamService family of webhook events.
public type SubteamService service object {
    # Triggered on Subteam created.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSubteamCreated(GenericEventWrapper payload) returns error?;

    # Triggered on Subteam members changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSubteamMembersChanged(GenericEventWrapper payload) returns error?;

    # Triggered on Subteam self added.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSubteamSelfAdded(GenericEventWrapper payload) returns error?;

    # Triggered on Subteam self removed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSubteamSelfRemoved(GenericEventWrapper payload) returns error?;

    # Triggered on Subteam updated.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSubteamUpdated(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the TeamService family of webhook events.
public type TeamService service object {
    # Triggered on Team domain change.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onTeamDomainChange(GenericEventWrapper payload) returns error?;

    # Triggered on Team join.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onTeamJoin(GenericEventWrapper payload) returns error?;

    # Triggered on Team rename.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onTeamRename(GenericEventWrapper payload) returns error?;

    # Triggered on Team access granted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onTeamAccessGranted(GenericEventWrapper payload) returns error?;

    # Triggered on Team access revoked.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onTeamAccessRevoked(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the TokensRevokedService family of webhook events.
public type TokensRevokedService service object {
    # Triggered on Tokens revoked.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onTokensRevoked(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the UserChangeService family of webhook events.
public type UserChangeService service object {
    # Triggered on User change.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onUserChange(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the AssistantService family of webhook events.
public type AssistantService service object {
    # Triggered on Assistant thread context changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAssistantThreadContextChanged(GenericEventWrapper payload) returns error?;

    # Triggered on Assistant thread started.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAssistantThreadStarted(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the CallService family of webhook events.
public type CallService service object {
    # Triggered on Call rejected.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onCallRejected(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the EntityService family of webhook events.
public type EntityService service object {
    # Triggered on Entity comments requested.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onEntityCommentsRequested(GenericEventWrapper payload) returns error?;

    # Triggered on Entity details requested.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onEntityDetailsRequested(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the FunctionService family of webhook events.
public type FunctionService service object {
    # Triggered on Function executed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onFunctionExecuted(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the InviteService family of webhook events.
public type InviteService service object {
    # Triggered on Invite requested.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onInviteRequested(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the SharedChannelService family of webhook events.
public type SharedChannelService service object {
    # Triggered on Shared channel invite accepted.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSharedChannelInviteAccepted(GenericEventWrapper payload) returns error?;

    # Triggered on Shared channel invite approved.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSharedChannelInviteApproved(GenericEventWrapper payload) returns error?;

    # Triggered on Shared channel invite declined.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSharedChannelInviteDeclined(GenericEventWrapper payload) returns error?;

    # Triggered on Shared channel invite received.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSharedChannelInviteReceived(GenericEventWrapper payload) returns error?;

    # Triggered on Shared channel invite requested.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onSharedChannelInviteRequested(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the UserService family of webhook events.
public type UserService service object {
    # Triggered on User huddle changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onUserHuddleChanged(GenericEventWrapper payload) returns error?;

    # Triggered on User profile changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onUserProfileChanged(GenericEventWrapper payload) returns error?;

    # Triggered on User status changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onUserStatusChanged(GenericEventWrapper payload) returns error?;

    # Triggered on User connection.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onUserConnection(GenericEventWrapper payload) returns error?;

    # Triggered on User guest status changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onUserGuestStatusChanged(GenericEventWrapper payload) returns error?;
};

# Attachable service type exposing the AgentService family of webhook events.
public type AgentService service object {
    # Triggered on Agent session stopped.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAgentSessionStopped(GenericEventWrapper payload) returns error?;

    # Triggered on Agent session title changed.
    # + payload - the GenericEventWrapper webhook payload
    # + return - an error if handling the event fails
    remote function onAgentSessionTitleChanged(GenericEventWrapper payload) returns error?;
};

# The union of every service type that can be attached to this listener.
public type GenericServiceType AppService|ChannelService|DndService|EmailDomainChangedService|EmojiChangedService|FileService|GridMigrationService|GroupService|ImService|LinkSharedService|MemberService|MessageService|PinService|ReactionService|StarService|SubteamService|TeamService|TokensRevokedService|UserChangeService|AssistantService|CallService|EntityService|FunctionService|InviteService|SharedChannelService|UserService|AgentService;

