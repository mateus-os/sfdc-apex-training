public class ProjectPublish {

    SetProjectLegacyOutboundService projectLegacyService;
    
    public List<Project__c> publishProjectLegacySystem(List<Project__c> projects) {
        projectLegacyService = new SetProjectLegacyOutboundService();

        return projectLegacyService.sendProjectToLegacySystem(projects);
    }

}