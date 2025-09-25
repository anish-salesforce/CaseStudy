public class AccountHelper {

    public static void updateHighValueAccounts(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.AnnualRevenue > 100000) {
                acc.Type = 'High Value';
            } else {
                acc.Type = 'Standard';
            }
        }
        update accounts;
    }

    public static List<Account> getHighValueAccounts() {
        return [SELECT Id, Name, Type FROM Account WHERE Type = 'High Value'];
    }
}
