# Channel message logger

The minimal, canonical `slack.trigger` use case: log every new message posted in the channels,
private channels and direct messages the app can see, with its channel type and whether it is a
thread reply. Edits, deletions and other message subtypes are skipped.

## Run

```bash
bal run
```

Then follow the [Setup guide](../../ballerina/README.md#setup-guide) in the package README to
expose this listener and set the Request URL, subscribing to `message.channels` (and
`message.groups`, `message.im` or `message.mpim` for the other conversation types). Invite the app
to a channel and post a message.
