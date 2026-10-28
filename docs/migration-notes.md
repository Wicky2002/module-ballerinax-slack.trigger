# Migration notes: from `trigger.slack` to `slack.trigger`

`ballerinax/slack.trigger` replaces `ballerinax/trigger.slack` (last released as 0.9.0 from the
`asyncapi-triggers` monorepo). The `ballerina/` source is generated from `docs/spec/asyncapi.yaml`
with the `asyncapi-tools` generator; changes go through the spec and a regeneration, not hand edits
to `ballerina/*.bal`. Every spec change and its source is listed in
[`docs/spec/sanitations.md`](spec/sanitations.md).

## Breaking change: package name and import

```ballerina
// before
import ballerinax/trigger.slack;

// after
import ballerinax/slack.trigger as slack;
```

## Breaking change: the listener verifies the signing secret

`trigger.slack` checked the `token` field of each request against a `verificationToken`. Slack has
deprecated verification tokens in favour of signed requests, so the listener now checks the
`X-Slack-Signature` header with your app's **Signing Secret** and rejects requests whose
`X-Slack-Request-Timestamp` is more than five minutes old.

```ballerina
// before
listener slack:Listener slackListener = new ({verificationToken: "xxxxxx"});

// after
listener slack:Listener slackListener = new ({webhookSecret: "<signing secret>"});
```

The signing secret is on the app's **Basic Information** page, under **App Credentials**.

## Breaking change: `onMessage` takes a `MessageEventWrapper`

`MessageService.onMessage` now receives `MessageEventWrapper`, whose `event` is a `MessageEvent`
with typed fields (`channel`, `channelType`, `user`, `text`, `ts`, `threadTs`, `subtype`, ...). The
old `Message` type was built from a single `message_deleted` sample and required fields that
ordinary messages don't have, so ordinary messages failed to bind.

## Breaking change: removed handlers

Sixteen remote functions are removed. None of them could be called by Slack's Events API today:

- `MessageService`: `onMessageAppHome`, `onMessageChannels`, `onMessageGroups`, `onMessageIm`,
  `onMessageMpim`. These are subscription names, not event types: Slack delivers all of them as
  `message`, so only `onMessage` was ever called. Use `payload.event.channelType` (`app_home`,
  `channel`, `group`, `im`, `mpim`) to tell them apart.
- `ChannelService.onChannelUnarchive`, `GroupService.onGroupArchive`,
  `GroupService.onGroupUnarchive`: RTM-only events, never sent to a Request URL.
- `FileService.onFileCommentAdded`, `FileService.onFileCommentEdited`: file comments were retired
  and the events no longer exist.
- `AppService.onAppRateLimited`: `app_rate_limited` arrives without an `event` object, so it cannot
  be routed by event type.
- `ResourcesService` (`onResourcesAdded`, `onResourcesRemoved`) and `ScopeService`
  (`onScopeDenied`, `onScopeGranted`): workspace-app events, retired on 2021-08-24.
- `UrlVerificationService.onUrlVerification`: the listener now answers the `url_verification`
  challenge itself, so remove this service.

The other 50 remote functions keep their names and service types.

## New handlers

34 Events API events are added. Fifteen go on existing service types:

- `AppService`: `onAppContextChanged`, `onAppDeleted`, `onAppHomeOpened`, `onAppInstalled`,
  `onAppRequested`, `onAppUninstalledTeam`
- `ChannelService`: `onChannelIdChanged`, `onChannelShared`, `onChannelUnshared`
- `GroupService`: `onGroupDeleted`
- `MessageService`: `onMessageMetadataDeleted`, `onMessageMetadataPosted`,
  `onMessageMetadataUpdated`
- `TeamService`: `onTeamAccessGranted`, `onTeamAccessRevoked`

Adding these to an existing service type means services written against `trigger.slack` must
implement the new functions too, since a service has to implement every function its type declares.

The rest come with new service types: `AgentService`, `AssistantService`, `CallService`,
`EntityService`, `FunctionService`, `InviteService`, `SharedChannelService` and `UserService`.

## Other changes

- Record fields are camelCase and keep the original JSON key through `@jsondata:Name`, for example
  `apiAppId` for `api_app_id` and `eventId` for `event_id`.
- `GenericEventWrapper` no longer requires `authed_users`, which Slack no longer sends, and declares
  `authorizations`, `eventContext`, `isExtSharedChannel`, `contextTeamId` and
  `contextEnterpriseId`.
- The listener acknowledges a delivery before it runs your handler, so a slow or failing handler no
  longer makes Slack retry. Handler errors are logged.
