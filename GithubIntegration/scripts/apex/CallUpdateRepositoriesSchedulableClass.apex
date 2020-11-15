String CRON = '0 0 17 * * ?';
String jobId = System.schedule('Update Repositories', CRON, new UpdateRepositoriesSchedulable());