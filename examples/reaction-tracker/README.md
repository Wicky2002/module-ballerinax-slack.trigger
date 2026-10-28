# Reaction tracker

Keep a running count of each emoji used as a reaction, updating it as reactions are added and
removed. The counts live in memory, so they start from zero each time the service starts.

## Run

```bash
bal run
```

Then follow the [Setup guide](../../ballerina/README.md#setup-guide) in the package README to
expose this listener and set the Request URL, subscribing to `reaction_added` and
`reaction_removed`. React to a message in a channel the app is in.
