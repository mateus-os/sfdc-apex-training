/**
 * @author mateus-os
 */
@isTest
public class SetProjectLegacyOutboundServiceTest {

    @isTest
    static void givenProjectWhenSentToLegacySystemThenReturnProjectWithSynchronizationStatusSuccess() {
        Map<String, SObject> records = ProjectFixtureFactory.createIntegratedScenario();

        SetProjectLegacyOutboundService projectLegacyService = new SetProjectLegacyOutboundService();

        List<Project__c> projects = new List<Project__c>{
            (Project__c) records.get('initiatedProject')
        };

        List<Project__c> publishedProjects = projectLegacyService.sendProjectToLegacySystem(projects);

        Project__c project = publishedProjects.get(0);

        System.assert(String.isEmpty(project.Id));
        System.assertEquals(project.SynchronizationStatus__c, 'Integrado com sucesso');
    }

}