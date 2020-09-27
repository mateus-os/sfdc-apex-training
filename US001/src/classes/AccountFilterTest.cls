/**
 * @author mateus-os
 */
@isTest
public class AccountFilterTest {

    @isTest
    static void givenCategoryAndRevenueEmptyWhenInsertReturnEmptyList() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('emptyCategoryAndRevenue')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size() );
        System.assert(filteredAccounts.size() == 0);
    }

    @isTest
    static void givenCategoryStandardWhenInsertReturnEmptyList() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('categoryStandard')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size() );
        System.assert(filteredAccounts.size() == 0);
    }

    @isTest
    static void givenCategoryPremiumAndRevenueUnderMilliondWhenInsertReturnEmptyList() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('premiumUnderMillion')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size() );
        System.assert(filteredAccounts.size() == 0);
    }

    @isTest
    static void givenCategoryPremiumAndRevenueOverMilliondWhenInsertReturnAccounts() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('premiumOverMillion')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertEquals(accounts.size(), filteredAccounts.size() );
    }

}