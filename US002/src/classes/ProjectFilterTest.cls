/**
 * @author mateus-os
 */
@isTest
public class ProjectFilterTest {

    @isTest
    static void givenProjectWhenInsertReturnEmptyFilter(){
        Map<String, SObject> records = ProjectFixtureFactory.createIntegratedScenario();

        List<Project__c> projects = new List<Project__c>{
            (Project__c) records.get('newProject')
        };

        ProjectFilter filter = new ProjectFilter();

        List<Project__c> filteredProjects = filter.filterByEntrepriseProjectStarted(projects, null);

        System.assert(filteredProjects.isEmpty());
    }

    @isTest
    static void givenProjectInsertedWhenUpdateStatusToInitiatedReturnNotEmptyFilter(){
        Map<String, SObject> records = ProjectFixtureFactory.createIntegratedScenario();

        List<Project__c> projects = new List<Project__c>{
            (Project__c) records.get('newProject')
        };

        List<Project__c> updatedProjects = new List<Project__c>();
        Map<Id,Project__c> oldProjects = new Map<Id, Project__c>();

        for (Project__c project : projects){
            oldProjects.put(project.Id, project);

            project.Status__c = 'Iniciado';
            updatedProjects.add(project);
        }
        
        ProjectFilter filter = new ProjectFilter();

        List<Project__c> filteredProjects = filter.filterByEntrepriseProjectStarted(updatedProjects, oldProjects);

        System.debug(JSON.serialize(filteredProjects));
        System.assertEquals(projects.size(), updatedProjects.size());
    }
}