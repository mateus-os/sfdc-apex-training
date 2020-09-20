/**
 * @author mateus-os
 */
@isTest
public class AccountFixtureFactory {

    public static Account newAccount ( String name, String category, Decimal annualRevenue) {   
        return new Account ( Name = name 
                , Category__c = category
                , AnnualRevenue = annualRevenue );
    }

    public static Account createAccount ( String name, String category, Decimal annualRevenue ) {
        return createAccount(newAccount(name, category, annualRevenue) );
    }

    public static Account createAccount ( Account account ) {
        insert account;
        return account;
    }

    public static Map<String, SObject> createIntegratedScenario () {
        Map<String, SObject> records = new Map<String, SObject>();

        Account account = createAccount('Client Empty', '', null);
        records.put ('emptyCategoryAndRevenue', account);
        
        account = createAccount('Client Standard', 'Standard', 100000);
        records.put ('categoryStandard', account);

        account = createAccount('Client Premium under million', 'Premium', 150000);
        records.put ('premiumUnderMillion', account);

        account = createAccount('Client Premium over million', 'Premium', 1500000);
        records.put ('premiumOverMillion', account);

        return records;
    }

}