# App mention alert

Raise an alert whenever someone mentions the app (`@your-app`) in a channel, and log who opens the
app's App Home. A starting point for a bot that answers questions or takes commands.

## Run

```bash
bal run
```

Then follow the [Setup guide](../../ballerina/README.md#setup-guide) in the package README to
expose this listener and set the Request URL, subscribing to `app_mention` and `app_home_opened`.
Invite the app to a channel and mention it.
