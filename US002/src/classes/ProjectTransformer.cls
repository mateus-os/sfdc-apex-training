/**
 * @author mateus-os 
 */
public class ProjectTransformer {
    public Project__c toProject(ProjectLegacySystem projectLegacy) {

        return new Project__c();
    }

    public ProjectLegacySystem toProjectLegacy(Project__c project) {
        ProjectLegacySystem projectLegacy = new ProjectLegacySystem();

        projectLegacy.name = project.ProjectName__c;
        projectLegacy.code = project.Id;
        projectLegacy.status = project.Status__c;
        projectLegacy.startDate = project.StartDate__c;
        projectLegacy.endDate = project.EndDate__c;
        projectLegacy.budget = project.Budget__c;
    
        return projectLegacy;
    }
}