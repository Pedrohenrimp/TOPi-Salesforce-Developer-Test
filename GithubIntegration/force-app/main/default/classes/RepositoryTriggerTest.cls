@isTest
public class RepositoryTriggerTest {
    @isTest
    static void testRepositoryShare() {
        Repository__c repo = new Repository__c();
        repo.Repository_ID__c = 999999;
        repo.Name = 'Test Repository';
        repo.Number_Of_Stars__c = 12345;
        repo.Number_Of_Forks__C = 1234;
        
        Test.startTest();
        insert repo;
        Test.stopTest();
        
        List<Repository__Share> repoShared = [SELECT parentId, UserOrGroupId FROM Repository__Share WHERE parentId = :repo.Id LIMIT 1];
        List<User> user = [SELECT Name FROM User WHERE Name = 'Pedro Mendes' LIMIT 1];
        
        System.assertEquals(repoShared[0].UserOrGroupId , user[0].Id, 'The repository was not shared correctly with the user.');
    }
}