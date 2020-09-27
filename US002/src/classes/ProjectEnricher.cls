/**
 * @author mateus-os
 */
public class ProjectEnricher {

    ProjectUpdateIntegrationStatus updateIntegration;

    public List<Project__c> enrichProjectLegacySystem(List<Project__c> projects) {
        updateIntegration = new ProjectUpdateIntegrationStatus();

        return updateIntegration.updateIntegrationStatus(projects);
    }
}