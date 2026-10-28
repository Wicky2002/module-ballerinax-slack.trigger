# Examples

The `ballerinax/slack.trigger` connector provides practical examples illustrating usage in various scenarios.

1. [Channel message logger](https://github.com/ballerina-platform/module-ballerinax-slack.trigger/tree/main/examples/channel-message-logger) - Log every new message in the conversations the app is in.
2. [App mention alert](https://github.com/ballerina-platform/module-ballerinax-slack.trigger/tree/main/examples/app-mention-alert) - Raise an alert when someone mentions the app.
3. [Reaction tracker](https://github.com/ballerina-platform/module-ballerinax-slack.trigger/tree/main/examples/reaction-tracker) - Count emoji reactions as they are added and removed.

## Prerequisites

Create a Slack app, copy its signing secret, and point its Event Subscriptions Request URL at the running example, as described in the [Setup guide](../ballerina/README.md#setup-guide). Each example's README lists the events to subscribe to.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
