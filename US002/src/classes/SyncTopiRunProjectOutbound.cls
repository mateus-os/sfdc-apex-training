/**
 * @author mateus-os
 */
public class SyncTopiRunProjectOutbound {
    public static final String END_POINT_URL = 'https://run.mocky.io/v3/b00daac0-de5d-4dd2-a7d0-ce9610aabb45';

    // error
    // public static final String END_POINT_URL = 'https://run.mocky.io/v3/cc05d8d2-807f-4563-acb3-a9f8ce391fac';

    TopiRunProjectTransformer transformer;

    ProjectRepository repository;

    public SyncTopiRunProjectOutbound(){
        transformer = new TopiRunProjectTransformer();
        repository = new ProjectRepository();
    }

    public Project__c sendProject (Project__c project) {
        Http http = new Http();

        HttpResponse response = http.send(buildRequest(project));
        
        if (response.getStatusCode() != 200){
            TopiRunErrorResponse errorResponse = (TopiRunErrorResponse)
                                JSON.deserialize(response.getBody(), TopiRunErrorResponse.class);

            return transformer.toProject(project, errorResponse);
        }

        TopiRunProjectResponse topiRunProjectResponse = (TopiRunProjectResponse)
                                JSON.deserialize(response.getBody(), TopiRunProjectResponse.class);

        return transformer.toProject(project, TopiRunProjectResponse);
    }

    private HttpRequest buildRequest (Project__c project){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(END_POINT_URL);
        request.setMethod('PUT');
        request.setHeader('Content-Type', 'application/json');

        TopiRunProjectRequest projectRequest = transformer.toTopiRunProject(project);

        String payload = JSON.serialize(projectRequest);

        request.setBody(payload);

        return request;
    }
}