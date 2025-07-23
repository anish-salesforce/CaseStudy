public class globalUtility {

    // PMD Violation: Property/variable name should be camelCase, not PascalCase
    public static String AccountPrefix = 'ACC-';

    public static String formatAccountName(String inputName) {
        if (String.isBlank(inputName)) {
            return 'Unknown Account';
        }
        return AccountPrefix + inputName.trim().toUpperCase();
    }

    public static Integer addNumbers(Integer a, Integer b) {
        return a + b;
    }
}