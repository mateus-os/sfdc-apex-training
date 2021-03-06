/**
 * @author mateus-os 
 */
public virtual class AccountTH extends TriggerHandler {

    List<Account> newAccounts;

    AccountFilter filter;

    AccountEventEnricher enricher;

    public AccountTH() {
        this ( (List<Account>) Trigger.new );
    }

    public AccountTH (List<Account> newAccounts) {
        this.newAccounts = newAccounts;

        this.filter = new AccountFilter();
        this.enricher = new AccountEventEnricher();
    }

    virtual
    override
    public void afterInsert() {
        enrichIfCategoryPremiumAndMillionAnnualRevenue();
    }

    virtual
    public void enrichIfCategoryPremiumAndMillionAnnualRevenue() {
        List<Account> filteredAccounts = this.filter.filterByCategoryPremiumAndMillionAnnualRevenue(newAccounts);

        this.enricher.enrichEventsWithAccounts(filteredAccounts);
    }
}