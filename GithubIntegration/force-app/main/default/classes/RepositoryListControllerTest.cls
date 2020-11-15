@isTest
public class RepositoryListControllerTest {
    static testMethod void testGetRepositories() {
        List<Repository__c> testRepositories = new List<Repository__c>();
        for(Integer i = 0; i < 8; i++) {
            Repository__c repo = new Repository__c();
            repo.Repository_ID__c = 99990 + i;
            repo.Name = 'Test Repo' + i;
            repo.Number_Of_Stars__c = (100 * i) + 1;
            repo.Number_Of_Forks__c = (10 * i) + 1;
            testRepositories.add(repo);
        }

        insert testRepositories;
        RepositoryListController repoListController = new RepositoryListController();
        List<Repository__c> controllerQueryRepositories = repoListController.getRepositories();
        List<Repository__c> testQueryRepositories = [SELECT Name FROM Repository__c WHERE Id IN :testRepositories ORDER BY Number_Of_Stars__c DESC];
        
        for(Integer i = 0; i < testQueryRepositories.size(); i++){
            System.AssertEquals(controllerQueryRepositories[i].Name, testQueryRepositories[i].Name, 'Test unsucessful.');
        }
    }
}
