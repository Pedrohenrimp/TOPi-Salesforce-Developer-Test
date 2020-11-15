public with sharing class RepositoryListController {
    private String sortOrder = 'Number_Of_Stars__c';
    
    public List<Repository__c> getRepositories() {
        List<Repository__c> results = Database.query(
            'SELECT Id, Name, Number_Of_Stars__c, Number_Of_Forks__c ' +
            'FROM Repository__c ' + 'ORDER BY ' + sortOrder + ' DESC ');
        return results;
    }
    
}