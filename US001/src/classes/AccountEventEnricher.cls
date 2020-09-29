/**
 * @author mateus-os
 */
public class AccountEventEnricher {

    EventPresentationScheduler eventScheduler;

    public List<Account> enrichEventsWithAccounts(List<Account> accounts){

        eventScheduler = new EventPresentationScheduler(accounts);
        eventScheduler.createEvents();

        return accounts;
    }

}