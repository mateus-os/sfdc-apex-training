/**
 * @author mateus-os 
 */
trigger Project on Project__c (after update) {
    new ProjectTH().run();
}