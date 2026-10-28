# Ballerina Slack.trigger connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-slack.trigger/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-slack.trigger/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-slack.trigger.svg)](https://github.com/ballerina-platform/module-ballerinax-slack.trigger/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/slack.trigger.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fslack.trigger)

## Overview

The Slack Trigger module allows you to listen to [Slack Events API](https://docs.slack.dev/apis/events-api/)
events, for example:
- Messages in channels, private channels, direct messages and the app's home (`message`)
- Mentions of your app (`app_mention`), App Home opens and installs
- Channel, file, reaction, pin, user group, team and user changes
- Shared channel invites, assistant threads and workflow function executions

This module receives Slack's event deliveries directly - it does not call Slack's Web API on your
behalf. Use the [`ballerinax/slack`](https://central.ballerina.io/ballerinax/slack/latest)
connector for that, for example to reply to a message.

### Key features

- Receives 84 Slack Events API events across 27 service types, including messages, mentions, reactions and channel changes
- Verifies every request with the app's signing secret (`X-Slack-Signature`) and rejects requests older than five minutes
- Answers Slack's `url_verification` challenge itself, so the Request URL verifies without any code
- Acknowledges each delivery before running your handler, so a slow or failing handler doesn't cause retries
- Services can be attached on their own path, so several triggers and HTTP services can share one port
- Trigger services are listed by `bal build --export-endpoints` (Ballerina 2201.13.6 or later)

## Setup guide

Before using this trigger in your Ballerina application, you need a Slack workspace where you can
install apps, a Slack app, and a Ballerina service that Slack can reach over the internet to deliver
events to. The two sections below cover both a quick local test setup and a production deployment.

### Try it out locally

Use this flow to test your event handling logic on your own machine before deploying anywhere,
using [ngrok](https://ngrok.com/) to expose your local listener to the internet.

1. Go to [api.slack.com/apps](https://api.slack.com/apps), click **Create New App**, choose
   **Blank app** (or **From scratch**), give it a name and pick your workspace.

2. On the app's **Basic Information** page, under **App Credentials**, click **Show** next to
   **Signing Secret** and copy it. Slack signs every request with this secret, and the listener
   uses it to reject requests that did not come from Slack.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-slack.trigger/main/docs/setup/resources/app-signing-secret.png" alt="Slack app Basic Information page with the Signing Secret under App Credentials" width="600">

3. Write your service (see [Quickstart](#quickstart) below) with the signing secret as
   `webhookSecret`, and run it locally with `bal run`. Note the port it's listening on (`8090` by
   default).

4. Expose that port with ngrok:

   ```bash
   ngrok http 8090
   ```

   Copy the `Forwarding` URL ngrok prints out - this is your temporary public Request URL.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-slack.trigger/main/docs/setup/resources/ngrok-forwarding.png" alt="ngrok forwarding a public URL to localhost:8090" width="600">

5. Make sure **Settings > Socket Mode** is turned off. With Socket Mode on, Slack sends events over
   a WebSocket instead of to your Request URL, and the listener never receives them.

6. Open **Features > Event Subscriptions** and turn **Enable Events** on.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-slack.trigger/main/docs/setup/resources/webhook-settings-page.png" alt="Slack Event Subscriptions page with Enable Events turned on" width="600">

7. Paste the ngrok forwarding URL into **Request URL**. Slack immediately sends a
   `url_verification` request with a `challenge`, and the listener answers it for you, so the
   field shows **Verified** as long as your service is running.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-slack.trigger/main/docs/setup/resources/webhook-form-filled.png" alt="Slack Request URL showing Verified for the ngrok URL" width="600">

8. Under **Subscribe to bot events**, click **Add Bot User Event** and add the events your service
   handles, for example `message.channels` and `app_mention`. Slack adds the OAuth scopes each
   event needs. Click **Save Changes**, then reinstall the app to your workspace when Slack asks,
   so the new scopes take effect.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-slack.trigger/main/docs/setup/resources/webhook-event-selection.png" alt="Slack bot event subscriptions with app_home_opened, message.channels and app_mention" width="600">

9. Invite the app to a channel (type `/invite @<your app>` in the channel) and post a message.
   Each delivery shows up in the ngrok console with `200 OK`, and your handler runs.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-slack.trigger/main/docs/setup/resources/webhook-confirmed.png" alt="ngrok console showing Slack event deliveries answered with 200 OK" width="600">

`message.channels`, `message.groups`, `message.im`, `message.mpim` and `message.app_home` are
subscription names, not separate events: Slack delivers all of them as a `message` event, so they
all arrive at `MessageService.onMessage`. Use `event.channelType` (`channel`, `group`, `im`,
`mpim` or `app_home`) to tell them apart.

### Production / business integration

For production use, deploy your Ballerina service somewhere with a stable, internet-reachable
HTTPS URL. Ballerina doesn't require any specific hosting platform - containers, a VM, a managed
PaaS, or anything else that gives you a stable HTTPS endpoint all work equally well.

Rather than hardcoding `webhookSecret` as shown in the Quickstart, inject it via `Config.toml` (or
your platform's equivalent configuration/secret mechanism), since it's a `configurable` value:

```toml
[<your_org>.<your_module_name>.userInput]
webhookSecret = "<your app's signing secret>"
```

Then set your production URL as the Request URL on the **Event Subscriptions** page.

Slack expects a response within three seconds and retries a delivery up to three times
otherwise. The listener responds before it runs your handler, so slow handlers don't cause
retries, but a retry can still arrive after a network problem. Use `eventId` to skip events you
have already handled.

### Compatibility

|                     | Version                       |
|---------------------|-------------------------------|
| Ballerina Language  | Ballerina Swan Lake 2201.13.0 |

## Quickstart

To use the Slack Trigger in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the Slack Trigger Ballerina library

```ballerina
import ballerinax/slack.trigger as slack;
```

### Step 2: Initialize the Slack Listener

Initialize the trigger by providing the listener config and a port number/`http:Listener` object.

```ballerina
configurable slack:ListenerConfig userInput = {
    webhookSecret: "xxxxxx"
};
listener slack:Listener slackListener = new (userInput, 8090);
```

`webhookSecret` should always be set to your Slack app's signing secret - this is what the trigger
uses to verify incoming requests actually came from Slack. Without it, the listener rejects every request with `401 Unauthorized`.

If you don't provide a port it will use the default port, which is 8090 - `webhookSecret` should
still always be set.

```ballerina
listener slack:Listener slackListener = new (userInput);
```

### Step 3: Use the correct service type to implement the service

Use the correct service type for the corresponding channel when implementing the service. For
example, if you need to listen to reaction events, use the `ReactionService` service type as
follows. Every remote function declared on a service type must be implemented - Ballerina requires
a complete implementation, not just the ones you care about.

```ballerina
service slack:ReactionService on slackListener {

    remote function onReactionAdded(slack:GenericEventWrapper payload) returns error? {
        return;
    }

    remote function onReactionRemoved(slack:GenericEventWrapper payload) returns error? {
        return;
    }
}
```

### Step 4: Provide remote functions corresponding to the events you're interested in

Remote functions must be implemented inside a service, on the matching service type for the
channel you're listening to - for example, `slack:MessageService` for messages.

```ballerina
import ballerina/log;

service slack:MessageService on slackListener {

    remote function onMessage(slack:MessageEventWrapper payload) returns error? {
        log:printInfo("Message received", channel = payload.event.'channel,
                user = payload.event.user, text = payload.event.text);
    }

    remote function onMessageMetadataDeleted(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onMessageMetadataPosted(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onMessageMetadataUpdated(slack:GenericEventWrapper payload) returns error? {
    }
}
```

### Step 5: Run the service

Use the `bal run` command to compile and run the Ballerina program.

### Step 6: Point your Slack app at your service

See [Setup guide](#setup-guide) above for the full walkthrough (with screenshots) of exposing your
service and setting the Request URL, for both local testing and production use.

## Examples

The `slack.trigger` module provides practical examples illustrating usage in various scenarios.
Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-slack.trigger/tree/main/examples/),
covering common event handling use cases.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/), **2201.13.0 or later**.

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`slack.trigger` package](https://central.ballerina.io/ballerinax/slack.trigger/latest).
* If you're moving from the older `trigger.slack` package, see the [migration notes](docs/migration-notes.md).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.