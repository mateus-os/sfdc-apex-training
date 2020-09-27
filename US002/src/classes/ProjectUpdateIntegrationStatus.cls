public class ProjectUpdateIntegrationStatus {

    ProjectRepository repository;

    public ProjectUpdateIntegrationStatus(){
        repository = new ProjectRepository();
    }

    public Project__c updateIntegrationStatus(Project__c project) {
        return repository.modify(project);
    }

    public List<Project__c> updateIntegrationStatus(List<Project__c> projects) {
        return repository.modify(projects);
    }
}