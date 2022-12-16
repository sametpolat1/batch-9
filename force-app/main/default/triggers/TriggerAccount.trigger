trigger TriggerAccount on Account (before insert) {
    System.debug('Trigger before insert');
}