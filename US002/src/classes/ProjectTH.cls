/**
 * @author mateus-os 
 */
public virtual class ProjectTH extends TriggerHandler {

    List<Project__c> newProjects;

    Map<Id,Project__c> oldProjects;

    ProjectFilter filter;

    ProjectEnricher enricher;

    public ProjectTH() {
        this ((List<Project__c>) Trigger.new, (Map<Id,Project__c>) Trigger.oldMap);
    }

    public ProjectTH (List<Project__c> newProjects , Map<Id,Project__c> oldProjects) {
        this.newProjects = newProjects;
        this.oldProjects = oldProjects;

        this.filter = new ProjectFilter();
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

        this.enricher.enrichProjectLegacySystem(filteredProjects);
    }

}