import ballerina/log;
import ballerinax/slack.trigger as slack;

configurable slack:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener slack:Listener slackListener = new (config, 8090);

// Running count per emoji, plus the IDs of events already counted so a redelivery isn't counted twice.
// Kept in memory; use an expiring store for the IDs in production.
isolated record {|map<int> counts; map<boolean> seen;|} reactions = {counts: {}, seen: {}};

// Tracks how often each emoji reaction is added and removed across the workspace.
service slack:ReactionService on slackListener {

    remote function onReactionAdded(slack:GenericEventWrapper payload) returns error? {
        string reaction = check payload.event["reaction"].ensureType();
        int? count = updateCount(payload.eventId, reaction, 1);
        if count is int {
            log:printInfo("Reaction added", reaction = reaction, user = payload.event["user"], count = count);
        }
    }

    remote function onReactionRemoved(slack:GenericEventWrapper payload) returns error? {
        string reaction = check payload.event["reaction"].ensureType();
        int? count = updateCount(payload.eventId, reaction, -1);
        if count is int {
            log:printInfo("Reaction removed", reaction = reaction, user = payload.event["user"], count = count);
        }
    }
}

// Returns the new count, or nil when the event was already counted.
isolated function updateCount(string eventId, string reaction, int delta) returns int? {
    lock {
        if reactions.seen.hasKey(eventId) {
            return ();
        }
        reactions.seen[eventId] = true;
        int count = int:max(0, (reactions.counts[reaction] ?: 0) + delta);
        reactions.counts[reaction] = count;
        return count;
    }
}
