trigger RepositoryTrigger on Repository__c (after insert) {

    List<User> user = [SELECT Id FROM User WHERE Name = 'Pedro Mendes' WITH SECURITY_ENFORCED LIMIT 1];
    List<Repository__Share> repositoriesToShare = new List<Repository__Share>();

    for(Repository__c repo : Trigger.new){
        if(Trigger.isAfter && Trigger.isInsert){
            Repository__Share repoToShare = new Repository__Share();
            repoToShare.ParentId = repo.Id;
            repoToShare.UserOrGroupId = user[0].Id;
            repoToShare.AccessLevel = 'Read';
            repoToShare.RowCause = Schema.Repository__Share.RowCause.Manual;
            repositoriesToShare.add(repoToShare);
            if(repositoriesToShare.size() > 0){
                try{
                    insert repositoriesToShare;
                }
                catch(Exception e){
                    System.debug(e);
                }
            }
        }
    }	
}