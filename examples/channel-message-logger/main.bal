import ballerina/log;
import ballerinax/slack.trigger as slack;

configurable slack:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener slack:Listener slackListener = new (config, 8090);

// Logs every new message in the conversations the app is in, skipping edits, deletions and other subtypes.
service slack:MessageService on slackListener {

    remote function onMessage(slack:MessageEventWrapper payload) returns error? {
        slack:MessageEvent message = payload.event;
        if message.subtype is string {
            log:printDebug("Skipped message subtype", subtype = message.subtype);
            return;
        }
        log:printInfo("Message received", channel = message.'channel, channelType = message.channelType,
                user = message.user, text = message.text, inThread = message.threadTs is string);
    }

    remote function onMessageMetadataDeleted(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onMessageMetadataPosted(slack:GenericEventWrapper payload) returns error? {
    }

    remote function onMessageMetadataUpdated(slack:GenericEventWrapper payload) returns error? {
    }
}
