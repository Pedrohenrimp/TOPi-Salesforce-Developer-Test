@isTest
private class UpdateRepositoriesSchedulableTest {
    @isTest
    static void testScheduleJob() {
        Test.startTest();
        String cron = '0 0 17 * * ?';
        String jobId = System.schedule('Test Update Repositories Schedule', cron, new UpdateRepositoriesSchedulable());
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE ID = :jobId];

        System.assertEquals(cron, ct.CronExpression, 'CRON Expression is wrong!');
        System.assertEquals(0, ct.TimesTriggered, 'Job is running!');        
        Test.stopTest();    
    }
}