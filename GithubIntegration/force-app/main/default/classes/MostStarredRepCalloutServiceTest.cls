@isTest
public class MostStarredRepCalloutServiceTest {
    @isTest
    static void testMakeGetCallout() {
        Test.setMock(HttpCalloutMock.class, new MostStarredRepCalloutServiceMock());
            
        Test.startTest();        
        MostStarredRepCalloutService.makeGetCallout();
        Test.stopTest();

        HttpRequest request = new HttpRequest();
        MostStarredRepCalloutServiceMock mock = new MostStarredRepCalloutServiceMock();
        HttpResponse response = mock.respond(request);

        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        List<Object> items = (List<Object>) results.get('items');                
        List<Repository__c> repositories = new List<Repository__c>();
                
        for(Object obj : items) {
            Map<String, Object> item = (Map<String, Object>) obj;
            Repository__c repo = new Repository__c();
            repo.Repository_ID__c = (Integer) item.get('id');
            repo.Name = (String) item.get('name');
            repo.Number_of_Forks__c = (Integer) item.get('forks_count');
            repo.Number_of_Stars__c = (Integer) item.get('stargazers_count');
            repositories.add(repo);                    
        }

        System.assertEquals(2 , repositories.size(), 'Has occurred an error with the returned data.');
    }
}