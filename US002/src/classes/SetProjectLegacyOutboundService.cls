/**
 * @author mateus-os
 */
public class SetProjectLegacyOutboundService {

    ProjectTransformer transformer;

    Project__c updatedProject;

    String endpointUrl;

    public SetProjectLegacyOutboundService(){
        transformer = new ProjectTransformer();
        endpointUrl = 'https://run.mocky.io/v3/b00daac0-de5d-4dd2-a7d0-ce9610aabb45';
    }

    public Project__c sendProjectToLegacySystem(Project__c project){
        updatedProject = project;
        return sendToLegacySystemService(transformer.toProjectLegacy(project));
    }

    private Project__c sendToLegacySystemService(ProjectLegacySystem projectLegacy) {
        HttpRequest request = new HttpRequest();

        // request.setEndpoint('https://run.mocky.io/v3/e61d7a35-d227-49e5-b5e5-7e0e2fdcee2d'); response broken
        
        request.setEndpoint(endpointUrl);
        request.setMethod('PUT');
        request.setBody(JSON.serialize(projectLegacy));
        request.setHeader('Content-Type', 'application/json');

        Http http = new Http();
        HttpResponse response = http.send(request);

        String payload = response.getBody();

        ProjectLegacySystem responseProjectLegacy = (ProjectLegacySystem) JSON.deserialize( payload , ProjectLegacySystem.class );

        if (response.getStatusCode() != 200) {
            updatedProject.SynchronizationStatus__c = 'Erro na sincronização de projetos';
            updatedProject.ErrorMessage__c = responseProjectLegacy.errorMessage;

            return updatedProject;
        }

        updatedProject.LastSyncDate__c = Datetime.now();
        updatedProject.SynchronizationStatus__c = 'Integrado com sucesso';

        return updatedProject;
    }

    public void setEndpointUrl(String url) {
        this.endpointUrl = url;
    }
}