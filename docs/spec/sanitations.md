# Sanitations for the slack AsyncAPI specification

Migrated from `asyncapi-triggers/asyncapi/slack/asyncapi.yml` (AsyncAPI 2.1.0) to AsyncAPI 3.0.0.

## Changes

1. Upgraded the document to AsyncAPI 3.0.0: each `subscribe` channel became a channel with named messages plus an `operations` entry with `action: receive`, and each `oneOf` entry became a named message carrying its `x-ballerina-event-type`.
2. `info.externalDocs` moved under `info`; the default content type is declared.
3. Channel names containing `/` (e.g. `email/domain/changed`) are camelCased for the channel key because `/` breaks `$ref` pointers; the original name stays as the address. Message names are the channel plus the event type.

4. Checked against the Slack Events API reference on 2026-10-05. Removed `resources_added`, `resources_removed`, `scope_denied` and `scope_granted`: they were emitted by workspace apps, retired on 2021-08-24, and have no equivalent (https://docs.slack.dev/changelog/2021-01-workspace-apps-retiring-the-platform-graveyard-in-aug-2021/).
5. Added 30 documented Events API events missing from the monorepo spec (e.g. `app_home_opened`, `app_installed`, `channel_shared`, `function_executed`, `message_metadata_*`, `shared_channel_invite_*`, `user_status_changed`). All use the generic event wrapper, as the existing events do. Not added because they are RTM-only: `bot_added`, `bot_changed`, `channel_joined`, `group_joined`, `external_org_migration_started`, `external_org_migration_finished`.

6. Re-checked every event on 2026-10-27 against the "Compatible APIs" line of its page under https://docs.slack.dev/reference/events/ (84 events remain):
   - Removed `channel_unarchive`, `group_archive` and `group_unarchive`: their pages list RTM only, so they are never sent to a Request URL.
   - Removed `file_comment_added` and `file_comment_edited`: their pages no longer exist (file comments were retired).
   - Removed `app_rate_limited`: it is sent with a top-level `type` and no `event` object, so `event.type` cannot identify it.
   - Added `agent_session_stopped`, `agent_session_title_changed`, `user_connection` and `user_guest_status_changed`, which are Events API events.
7. Folded `message.app_home`, `message.channels`, `message.groups`, `message.im` and `message.mpim` into `message`. These are subscription names, not event types: Slack delivers all of them with `event.type` `message` and tells them apart with `event.channel_type` (see the example on https://docs.slack.dev/reference/events/message.channels/). As separate events their handlers could never be called.
8. Declared the signature in `x-ballerina-auth`: Slack signs `v0:<X-Slack-Request-Timestamp>:<body>` with HMAC-SHA256 keyed by the app's Signing Secret and sends `X-Slack-Signature: v0=<hex>`; requests older than five minutes are rejected through `freshness` on `X-Slack-Request-Timestamp` in seconds (https://docs.slack.dev/authentication/verifying-requests-from-slack/).
9. `url_verification` is now the endpoint verification handshake rather than an event: a `receive` operation with a `reply`, identified by `type: url_verification` and answered by echoing `challenge` (https://docs.slack.dev/reference/events/url_verification). As an event it had no `event` object, so it never matched and the Request URL could not be verified.
10. The event wrapper now follows the "Callback field overview" of https://docs.slack.dev/apis/events-api/: `authed_users` is no longer required (Slack sends `authorizations` instead, and the monorepo spec required `authed_users`, so current deliveries failed to bind); `authorizations`, `event_context`, `is_ext_shared_channel`, `context_team_id` and `context_enterprise_id` are declared; `event.event_ts` is optional, as several documented examples omit it. The example for the retired `resources_added` event is removed.
11. `message` had a schema generated from a single `message_deleted` sample with a file comment, which required `deleted_ts`, `subtype`, `hidden` and `previous_message`, so an ordinary message failed to bind. It now uses the event wrapper with a `MessageEvent` that requires only `type`, `channel` and `ts` and declares the common fields (`subtype`, `channel_type`, `user`, `text`, `thread_ts`, `edited`, ...).
12. Documentation links point at `docs.slack.dev`, where `api.slack.com/events/...` now redirects.

## Test payloads

Each of the 84 files under `ballerina/tests/resources/trigger_payloads` is the example on the event's own page under https://docs.slack.dev/reference/events/, with these mechanical fixes:

- Trailing commas removed, elided values written as `[...]`, `{...}` or `{ "..." }` replaced with an empty array or object, and `//` comments removed, so the examples are valid JSON.
- Where the example was the inner event only (`agent_session_stopped`, `agent_session_title_changed`), it is wrapped in the envelope from the `message.channels` example.
- The `team_access_granted` and `team_access_revoked` examples nest the event twice (`event.event`). This looks like a documentation error, since every other event and the callback field overview have one `event`; the fixtures use the inner event in the standard wrapper. Not verified against a real delivery.

## Open questions (not changed)

- A few events are limited to organization-ready apps or need scopes such as `admin.apps:read`.

Author: Dinuka Wickramasinghe
