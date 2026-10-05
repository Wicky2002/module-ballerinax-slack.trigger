# Sanitations for the slack AsyncAPI specification

Migrated from `asyncapi-triggers/asyncapi/slack/asyncapi.yml` (AsyncAPI 2.1.0) to AsyncAPI 3.0.0.

## Changes

1. Upgraded the document to AsyncAPI 3.0.0: each `subscribe` channel became a channel with named messages plus an `operations` entry with `action: receive`, and each `oneOf` entry became a named message carrying its `x-ballerina-event-type`.
2. `info.externalDocs` moved under `info`; the default content type is declared.
3. Channel names containing `/` (e.g. `email/domain/changed`) are camelCased for the channel key because `/` breaks `$ref` pointers; the original name stays as the address. Message names are the channel plus the event type.

## Open questions (not changed)

- Slack signs requests with `X-Slack-Signature` (v0 HMAC over version, timestamp and body); this is not declared yet.
- The `url_verification` challenge handshake is a channel here, but a connector must echo the challenge; check how the generator treats it.

Author: Dinuka Wickramasinghe
