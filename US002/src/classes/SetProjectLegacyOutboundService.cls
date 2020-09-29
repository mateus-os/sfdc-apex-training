/**
 * @author mateus-os
 */
public class SetProjectLegacyOutboundService {

    ProjectTransformer transformer;

    public static List<Project__c> projectsWithIntegrationStatus;

    public SetProjectLegacyOutboundService(){
        transformer = new ProjectTransformer();
        projectsWithIntegrationStatus = new List<Project__c>();
    }

    public void sendProjectToLegacySystem(List<Project__c> projects){
        ProjectLegacySystem projectLegacy = new ProjectLegacySystem();

        for (Project__c project : projects) {
            projectLegacy = transformer.toProjectLegacy(project);
            sendToLegacySystemService(JSON.serialize(projectLegacy), projectLegacy.code);
        }
    }

    @future (callout=true)
    public static void sendToLegacySystemService(String body, String id) {
        HttpRequest request = new HttpRequest();

        // request.setEndpoint('https://run.mocky.io/v3/e61d7a35-d227-49e5-b5e5-7e0e2fdcee2d'); response broken

        request.setEndpoint('https://run.mocky.io/v3/b00daac0-de5d-4dd2-a7d0-ce9610aabb45');
        request.setMethod('PUT');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');

        Http http = new Http();
        HttpResponse response = http.send(request);

        String payload = response.getBody();

        ProjectLegacySystem responseProjectLegacy = (ProjectLegacySystem) JSON.deserialize( payload , ProjectLegacySystem.class );
        responseProjectLegacy.code = id;

        
        if (response.getStatusCode() == 200) {
            updateProjectWithSuccessIntegrationInformation(responseProjectLegacy);
        } else {
            updateProjectWithFailIntegrationInformation(responseProjectLegacy);
        }
    }

    private static void updateProjectWithSuccessIntegrationInformation(ProjectLegacySystem projectLegacy){
        Project__c project = new Project__c();

        project.Id = projectLegacy.code;    
        project.LastSyncDate__c = Datetime.now();
        project.SynchronizationStatus__c = 'Integrado com sucesso';

        projectsWithIntegrationStatus.add(project);
    }

    private static void updateProjectWithFailIntegrationInformation(ProjectLegacySystem projectLegacy){
        Project__c project = new Project__c();

        project.Id = projectLegacy.code;
        project.ErrorMessage__c = projectLegacy.errorMessage;
        project.SynchronizationStatus__c = 'Erro na sincronização de projetos';

        projectsWithIntegrationStatus.add(project);        
    }
}