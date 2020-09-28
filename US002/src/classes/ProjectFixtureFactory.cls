/**
 * @author mateus-os
 */
@isTest
public class ProjectFixtureFactory {
    
    public static Project__c newProject (String projectName, String id, String status,
                                    String type, Date startDate, Date endDate, Double budget) {
        return new Project__c( ProjectName__c = projectName
                , Id__c = id
                , Status__c = status
                , Type__c = type
                , StartDate__c = startDate
                , EndDate__c = endDate
                , Budget__c = budget);
    }

    public static Project__c createProject(String projectName, String id, String status,
                                    String type, Date startDate, Date endDate, Double budget) {
        return createProject( newProject(projectName, id, status, type, startDate, endDate, budget));
    }

    public static Project__c createProject(Project__c project) {
        insert project;
        return project;
    }

    public static Map<String, SObject> createIntegratedScenario() {
        Map<String, SObject> records = new Map<String, SObject>();

        Project__c project = createProject('TopiRun US002', '27092020', 'Criado',
                                        'Enterprise', Date.today(), Date.today().addMonths(6), 400000);
        records.put ('newProject', project);

        return records;
    }
}