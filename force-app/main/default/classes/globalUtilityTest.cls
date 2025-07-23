@isTest
public class globalUtilityTest {

    @isTest static void testFormatAccountName() {
        String result1 = GlobalUtility.formatAccountName('  test inc ');
        System.assertEquals('ACC-TEST INC', result1);

        String result2 = GlobalUtility.formatAccountName('');
        System.assertEquals('Unknown Account', result2);
    }

    @isTest static void testAddNumbers() {
        Integer sum = GlobalUtility.addNumbers(5, 7);
        System.assertEquals(12, sum);
    }
}