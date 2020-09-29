/**
 * @author mateus-os
 */
public virtual class ProjectRepository {

    virtual
    public Project__c modify (Project__c project) {
        update project;
        return project;
    }

    virtual
    public List<Project__c> modify (List<Project__c> projects) {
        update projects;
        return projects;
    }
}