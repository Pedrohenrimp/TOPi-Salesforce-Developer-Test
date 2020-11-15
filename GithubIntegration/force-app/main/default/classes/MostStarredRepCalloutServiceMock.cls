@isTest
public class MostStarredRepCalloutServiceMock implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"items": [{"id": 121395510, "name": "CS-Notes", "stargazers_count": 114658, "forks_count": 37339},'
					+'{"id": 132464395, "name": "JavaGuide",  "stargazers_count": 91704, "forks_count": 31702}]}');                
        return response;
    }
}