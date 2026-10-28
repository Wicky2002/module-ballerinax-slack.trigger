# Changelog
This file contains all the notable changes done to the Ballerina Slack trigger through the releases.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- The `slack.trigger` package, replacing `trigger.slack` from the `asyncapi-triggers` monorepo. It is generated from the AsyncAPI definition in `docs/spec` with the Ballerina AsyncAPI tool and covers 84 Events API events. See the [migration notes](docs/migration-notes.md) for what changed from `trigger.slack`.
- Request signature verification with the app's signing secret (`X-Slack-Signature`, with requests older than five minutes rejected), replacing the deprecated verification token.
- The listener answers Slack's `url_verification` challenge itself, so the Request URL verifies without any service code.
- 34 Events API events that `trigger.slack` lacked, such as `app_home_opened`, `channel_shared`, `function_executed`, `message_metadata_*`, `shared_channel_invite_*` and `user_status_changed`.
- Services on the trigger listener are listed by `bal build --export-endpoints`, through a compiler plugin packaged with the trigger.
- Trigger metadata and icons under `metadata/` for low-code tooling.
