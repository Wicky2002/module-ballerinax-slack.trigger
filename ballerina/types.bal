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

import ballerina/data.jsondata;

# Configuration for the webhook listener, including the secret used to verify incoming requests.
public type ListenerConfig record {
    # The secret used to verify incoming webhook signatures.
    string webhookSecret?;
};

# Standard event wrapper for the Events API
public type GenericEventWrapper record {|
    # The unique identifier your installed Slack application.
    @jsondata:Name {value: "api_app_id"}
    string apiAppId;
    # The actual event, an object, that happened
    Event event;
    # A unique identifier for this specific event, globally unique across all workspaces.
    @jsondata:Name {value: "event_id"}
    string eventId;
    # The epoch timestamp in seconds indicating when this event was dispatched.
    @jsondata:Name {value: "event_time"}
    int eventTime;
    # The unique identifier of the workspace where the event occurred
    @jsondata:Name {value: "team_id"}
    string teamId;
    # A verification token to validate the event originated from Slack
    string token;
    # Indicates which kind of event dispatch this is, usually `event_callback`
    string 'type;
    # The installation of your app that the event is visible to
    EventAuthorization[] authorizations?;
    # An identifier for this specific event, used with apps.event.authorizations.list
    @jsondata:Name {value: "event_context"}
    string eventContext?;
    # Whether the event happened in a channel shared with another organization
    @jsondata:Name {value: "is_ext_shared_channel"}
    boolean isExtSharedChannel?;
    # The workspace the event happened in
    @jsondata:Name {value: "context_team_id"}
    string contextTeamId?;
    # The organization the event happened in, or null outside Enterprise Grid
    @jsondata:Name {value: "context_enterprise_id"}
    string? contextEnterpriseId?;
    # Users the event is visible to. Deprecated; Slack sends `authorizations` now
    @jsondata:Name {value: "authed_users"}
    string[] authedUsers?;
    json...;
|};

# The actual event, an object, that happened
public type Event record {|
    # When the event was dispatched
    @jsondata:Name {value: "event_ts"}
    string eventTs?;
    # The specific name of the event
    string 'type;
    # The message content
    string text?;
    json...;
|};

# An installation of your app that can see the event
public type EventAuthorization record {|
    # The organization the installation belongs to, or null outside Enterprise Grid.
    @jsondata:Name {value: "enterprise_id"}
    string? enterpriseId?;
    # The workspace the installation belongs to, or null for an organization-wide installation.
    @jsondata:Name {value: "team_id"}
    string? teamId?;
    # The user the installation acts as.
    @jsondata:Name {value: "user_id"}
    string userId?;
    # Whether the installation is a bot user.
    @jsondata:Name {value: "is_bot"}
    boolean isBot?;
    # Whether the app is installed across the whole Enterprise Grid organization.
    @jsondata:Name {value: "is_enterprise_install"}
    boolean isEnterpriseInstall?;
    json...;
|};

# Message event wrapper
public type MessageEventWrapper record {|
    # The unique identifier your installed Slack application.
    @jsondata:Name {value: "api_app_id"}
    string apiAppId;
    # A message posted to a channel, private channel, DM, group DM or the app's home. `channel_type` tells them apart
    # (`channel`, `group`, `im`, `mpim`, `app_home`), and `subtype` marks special messages such as `message_changed`,
    # `message_deleted` or `bot_message`.
    MessageEvent event;
    # A unique identifier for this specific event, globally unique across all workspaces.
    @jsondata:Name {value: "event_id"}
    string eventId;
    # The epoch timestamp in seconds indicating when this event was dispatched.
    @jsondata:Name {value: "event_time"}
    int eventTime;
    # The unique identifier of the workspace where the event occurred
    @jsondata:Name {value: "team_id"}
    string teamId;
    # A verification token to validate the event originated from Slack
    string token;
    # Indicates which kind of event dispatch this is, usually `event_callback`
    string 'type;
    # The installation of your app that the event is visible to
    EventAuthorization[] authorizations?;
    # An identifier for this specific event, used with apps.event.authorizations.list
    @jsondata:Name {value: "event_context"}
    string eventContext?;
    # Whether the event happened in a channel shared with another organization
    @jsondata:Name {value: "is_ext_shared_channel"}
    boolean isExtSharedChannel?;
    # The workspace the event happened in
    @jsondata:Name {value: "context_team_id"}
    string contextTeamId?;
    # The organization the event happened in, or null outside Enterprise Grid
    @jsondata:Name {value: "context_enterprise_id"}
    string? contextEnterpriseId?;
    # Users the event is visible to. Deprecated; Slack sends `authorizations` now
    @jsondata:Name {value: "authed_users"}
    string[] authedUsers?;
    json...;
|};

# A message posted to a channel, private channel, DM, group DM or the app's home. `channel_type` tells them apart
# (`channel`, `group`, `im`, `mpim`, `app_home`), and `subtype` marks special messages such as `message_changed`,
# `message_deleted` or `bot_message`.
public type MessageEvent record {|
    # Always `message`.
    string 'type;
    # The kind of special message, absent for an ordinary message.
    string subtype?;
    # The ID of the conversation the message was posted in.
    string 'channel;
    # The type of conversation, `channel`, `group`, `im`, `mpim` or `app_home`.
    @jsondata:Name {value: "channel_type"}
    string channelType?;
    # The ID of the user who sent the message. Absent for some subtypes.
    string user?;
    # The ID of the bot that sent the message, for bot messages.
    @jsondata:Name {value: "bot_id"}
    string botId?;
    # The text of the message.
    string text?;
    # The message's unique timestamp within the conversation.
    string ts;
    # The timestamp of the thread's parent message, for a message in a thread.
    @jsondata:Name {value: "thread_ts"}
    string threadTs?;
    # When the event was dispatched.
    @jsondata:Name {value: "event_ts"}
    string eventTs?;
    # Whether the message is hidden from the conversation, as for some subtypes.
    boolean hidden?;
    # The timestamp of the deleted message, for `message_deleted`.
    @jsondata:Name {value: "deleted_ts"}
    string deletedTs?;
    # Who edited the message and when, for an edited message.
    Edited edited?;
    # The message after the change, for `message_changed`.
    map<json> message?;
    # The message before the change, for `message_changed` and `message_deleted`.
    @jsondata:Name {value: "previous_message"}
    map<json> previousMessage?;
    json...;
|};

# Who edited the message and when, for an edited message.
public type Edited record {|
    # The ID of the user who edited the message.
    string user?;
    # When the message was edited.
    string ts?;
    json...;
|};
