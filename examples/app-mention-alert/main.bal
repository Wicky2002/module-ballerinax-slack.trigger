import ballerina/log;
import ballerinax/slack.trigger as slack;

configurable slack:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener slack:Listener slackListener = new (config, 8090);

// Raises an alert whenever someone mentions the app, and notes who opens its App Home.
service slack:AppService on slackListener {

    remote function onAppMention(slack:GenericEventWrapper payload) returns error? {
        slack:Event event = payload.event;
        log:printWarn("App mentioned", user = event["user"], channel = event["channel"], text = event.text,
                workspace = payload.teamId);
    }

    remote function onAppHomeOpened(slack:GenericEventWrapper payload) returns error? {
        log:printInfo("App Home opened", user = payload.event["user"], tab = payload.event["tab"]);
    }

    remote function onAppUninstalled(slack:GenericEventWrapper payload) returns error? {
        log:printInfo("App uninstalled", workspace = payload.teamId);
    }

    remote function onAppContextChanged(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onAppDeleted(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onAppInstalled(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onAppRequested(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onAppUninstalledTeam(slack:GenericEventWrapper payload) returns error? {
    }
}
