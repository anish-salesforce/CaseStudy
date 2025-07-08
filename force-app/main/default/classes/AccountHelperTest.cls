@isTest
public class AccountHelperTest {

    @isTest
    static void testUpdateAccountTypes() {
        // Create test data
        Account acc1 = new Account(Name = 'Test Account 1', AnnualRevenue = 1500000);
        Account acc2 = new Account(Name = 'Test Account 2', AnnualRevenue = 500000);
        insert new List<Account>{acc1, acc2};

        // Re-query to get fresh references
        List<Account> accountsToUpdate = [SELECT Id, AnnualRevenue, Type FROM Account WHERE Id IN :new List<Id>{acc1.Id, acc2.Id}];

        // Call method under test
        Test.startTest();
        AccountHelper.updateAccountTypes(accountsToUpdate);
        Test.stopTest();

        // Assert
        Account updatedAcc1 = [SELECT Type FROM Account WHERE Id = :acc1.Id];
        Account updatedAcc2 = [SELECT Type FROM Account WHERE Id = :acc2.Id];

        System.assertEquals('Customer', updatedAcc1.Type);
        System.assertEquals(null, updatedAcc2.Type); // Should remain unchanged
    }
}
