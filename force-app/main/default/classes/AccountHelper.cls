public class AccountHelper {

    public static void updateAccountTypes(List<Account> ACCOUNTS) { // ❌ PMD Violation: Parameter name should be camelCase
        for (Account acc : ACCOUNTS) {
            if (acc.AnnualRevenue > 1000000) {
                acc.Type = 'Customer';
                update acc; // ❌ PMD Violation: Avoid DML statements in loops
            }
        }
    }
}
