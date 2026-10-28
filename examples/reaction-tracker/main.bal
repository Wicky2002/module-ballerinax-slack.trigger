import ballerina/log;
import ballerinax/slack.trigger as slack;

configurable slack:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener slack:Listener slackListener = new (config, 8090);

// Running count of each emoji currently used as a reaction, kept in memory.
isolated map<int> reactionCounts = {};

// Tracks how often each emoji reaction is added and removed across the workspace.
service slack:ReactionService on slackListener {

    remote function onReactionAdded(slack:GenericEventWrapper payload) returns error? {
        string reaction = check payload.event["reaction"].ensureType();
        int count = updateCount(reaction, 1);
        log:printInfo("Reaction added", reaction = reaction, user = payload.event["user"], count = count);
    }

    remote function onReactionRemoved(slack:GenericEventWrapper payload) returns error? {
        string reaction = check payload.event["reaction"].ensureType();
        int count = updateCount(reaction, -1);
        log:printInfo("Reaction removed", reaction = reaction, user = payload.event["user"], count = count);
    }
}

isolated function updateCount(string reaction, int delta) returns int {
    lock {
        int count = int:max(0, (reactionCounts[reaction] ?: 0) + delta);
        reactionCounts[reaction] = count;
        return count;
    }
}
