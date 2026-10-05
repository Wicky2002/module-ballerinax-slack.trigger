# Sanitations for the slack AsyncAPI specification

Migrated from `asyncapi-triggers/asyncapi/slack/asyncapi.yml` (AsyncAPI 2.1.0) to AsyncAPI 3.0.0.

## Changes

1. Upgraded the document to AsyncAPI 3.0.0: each `subscribe` channel became a channel with named messages plus an `operations` entry with `action: receive`, and each `oneOf` entry became a named message carrying its `x-ballerina-event-type`.
2. `info.externalDocs` moved under `info`; the default content type is declared.
3. Channel names containing `/` (e.g. `email/domain/changed`) are camelCased for the channel key because `/` breaks `$ref` pointers; the original name stays as the address. Message names are the channel plus the event type.

4. Checked against the Slack Events API reference on 2026-10-05. Removed `resources_added`, `resources_removed`, `scope_denied` and `scope_granted`: they were emitted by workspace apps, retired on 2021-08-24, and have no equivalent (https://docs.slack.dev/changelog/2021-01-workspace-apps-retiring-the-platform-graveyard-in-aug-2021/).
5. Added 30 documented Events API events missing from the monorepo spec (e.g. `app_home_opened`, `app_installed`, `channel_shared`, `function_executed`, `message_metadata_*`, `shared_channel_invite_*`, `user_status_changed`). All use the generic event wrapper, as the existing events do. Not added because they are RTM-only: `bot_added`, `bot_changed`, `channel_joined`, `group_joined`, `external_org_migration_started`, `external_org_migration_finished`.

## Open questions (not changed)

- Per-event delivery details were read from each event page (summarised, not hand-checked line by line); a few are limited to organization-ready apps or need scopes such as `admin.apps:read`.

- Slack signs requests with `X-Slack-Signature`: `v0=` plus the HMAC-SHA256 hex digest of `v0:<X-Slack-Request-Timestamp>:<body>`, with a 5 minute timestamp window. The timestamp participates, so this is not declared yet.
- The `url_verification` challenge handshake is a channel here, but a connector must echo the challenge; check how the generator treats it.

Author: Dinuka Wickramasinghe
