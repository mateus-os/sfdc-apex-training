/**
 * @author mateus-os
 */
public class AccountFilter {

    public List<Account> filterByCategoryPremiumAndMillionAnnualRevenue(List<Account> newAccounts) {

        List<Account> filteredAccounts = new List<Account>();

        for (Account account : newAccounts) {
            if( String.isEmpty(account.Category__c) || account.AnnualRevenue == null) {
                continue;
            }

            if( account.Category__c == 'Premium' && account.AnnualRevenue > 1000000) {
                    filteredAccounts.add(account);
            }
        }

        return filteredAccounts;
    }
}