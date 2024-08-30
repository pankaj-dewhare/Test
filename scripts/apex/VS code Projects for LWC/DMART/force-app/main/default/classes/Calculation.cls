public class Calculation {
    
 public static integer x = 100;
    
    @testVisible
    private static integer addition(integer a, integer b){
        integer sum;
        sum = a+b;
        system.debug('Sum='+sum);
        return sum;
    }
    
    
}