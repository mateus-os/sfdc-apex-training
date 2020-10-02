public class SendTopiProjectAsync {

    List<Project__c> projects;

    public SendTopiProjectAsync(List<Project__c> projects) {
        this.projects = projects;
    }

    @future(callout = true)
    public static void sendProject(List<String> projectIds) {
        ProjectRepository repository = new ProjectRepository();

        List<Project__c> projects = repository.findByIds(projectIds);

        SyncTopiRunProjectOutbound service;

        for (Project__c project : projects) {
            service = new SyncTopiRunProjectOutbound();
            service.sendProject(project);
        }

        repository.store(projects);
    }
}