/**
 * @author mateus-os 
 */
public virtual class ProjectTH extends TriggerHandler {

    List<Project__c> newProjects;

    Map<Id,Project__c> oldProjects;

    ProjectFilter filter;

    ProjectPublish publisher;

    ProjectEnricher enricher;

    public ProjectTH() {
        this ((List<Project__c>) Trigger.new, (Map<Id,Project__c>) Trigger.oldMap);
    }

    public ProjectTH (List<Project__c> newProjects , Map<Id,Project__c> oldProjects) {
        this.newProjects = newProjects;
        this.oldProjects = oldProjects;

        this.filter = new ProjectFilter();
        this.publisher = new ProjectPublish();
        this.enricher = new ProjectEnricher();    
    }

    virtual
    override
    public void afterUpdate() {
        enrichIfTypeEntrepriseAndStatusInitiated();
    }

    virtual
    public void enrichIfTypeEntrepriseAndStatusInitiated() {
        List<Project__c> filteredProjects = this.filter.filterByTypeEntrepriseAndStatusInitiated(newProjects, oldProjects);

        List<Project__c> publishedProjects = this.publisher.publishProjectLegacySystem(filteredProjects);

        this.enricher.enrichProjectLegacySystem(publishedProjects);
    }
}