public class UpdateRepositoriesSchedulable implements Schedulable{
    public void execute(SchedulableContext ctx) {
        MostStarredRepCalloutService.makeGetCallout();     
    }
}