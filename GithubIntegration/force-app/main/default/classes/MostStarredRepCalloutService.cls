public with sharing class MostStarredRepCalloutService {
    @future(callout=true)
    public static void makeGetCallout() {              
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1');
            request.setMethod('GET');            
            HttpResponse response = http.send(request);
                      
            if(response.getStatusCode() == 200) {
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                Object[] items = (List<Object>) results.get('items');                
                Repository__c [] repositories = new List<Repository__c>();
                
                for(Object obj : items) {
                    Map<String, Object> item = (Map<String, Object>) obj;
                    Repository__c repo = new Repository__c();
                    repo.Repository_ID__c = (Integer) item.get('id');
                    repo.Name = (String) item.get('name');
                    repo.Number_of_Forks__c = (Integer) item.get('forks_count');
                    repo.Number_of_Stars__c = (Integer) item.get('stargazers_count');
                    repositories.add(repo);                    
                }
                SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.UPSERTABLE, repositories);
                upsert securityDecision.getRecords();
                                
            } else {
                System.debug('An error has occurred: ' + response.getStatus());
            }
            
        } catch (Exception e) {
            System.debug('An exception has occurred: '+ e.getMessage());            
        }
        
    }
}