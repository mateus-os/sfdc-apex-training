/**
 * @author mateus-os
 */
public class ProjectFilter extends Filter{

    public List<Project__c> filterByEnterpriseProjectStarted(List<Project__c> newProjects
                                                                , Map<Id, Project__c> oldProjects) {
        
        List<Project__c> filteredProjects = new List<Project__c>();

        if(oldProjects == null || oldProjects.isEmpty()) return filteredProjects;

        for (Project__c project : newProjects) {            
            if (project.Status__c == oldProjects.get(project.Id).Status__c) {
                continue;
            }


            if(project.Type__c == 'Enterprise' && project.Status__c == 'Iniciado') {
                filteredProjects.add(project);
            }
        }

        return filteredProjects;
    }
}