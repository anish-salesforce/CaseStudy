@isTest
private class AccountHelperTest {

    @testSetup
    static void createTestData() {
        List<Account> testAccounts = new List<Account>();

        testAccounts.add(new Account(Name = 'Acme Corp', AnnualRevenue = 2000000));
        testAccounts.add(new Account(Name = 'Beta Ltd', AnnualRevenue = 500000));
        testAccounts.add(new Account(Name = 'Gamma Inc', AnnualRevenue = 3000000));

        insert testAccounts;
    }

    @isTest
    static void testUpdateHighValueAccounts() {
        List<Account> accounts = [SELECT Id, Name, AnnualRevenue, Type FROM Account];
        AccountHelper.updateHighValueAccounts(accounts);

        for (Account acc : accounts) {
            if (acc.AnnualRevenue > 1000000) {
                System.assertEquals('High Value', acc.Type, 'Expected High Value Type');
            } else {
                System.assertEquals('Standard', acc.Type, 'Expected Standard Type');
            }
        }
    }

    @isTest
    static void testGetHighValueAccounts() {
        // First, run the logic to categorize the accounts
        List<Account> accounts = [SELECT Id, AnnualRevenue FROM Account];
        AccountHelper.updateHighValueAccounts(accounts);

        // Now fetch high-value accounts using the method under test
        List<Account> highValueAccounts = AccountHelper.getHighValueAccounts();

        System.assertEquals(2, highValueAccounts.size(), 'There should be 2 high-value accounts');
        for (Account acc : highValueAccounts) {
            System.assertEquals('High Value', acc.Type);
        }
    }
}
