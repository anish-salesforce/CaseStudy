public class AccountHelper {

    public static void updateAccountTypes(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.AnnualRevenue > 1000000) {
                acc.Type = 'Customer';
                update acc; // ❌ PMD Violation: Avoid DML statements in loops
            }
        }
    }
}
