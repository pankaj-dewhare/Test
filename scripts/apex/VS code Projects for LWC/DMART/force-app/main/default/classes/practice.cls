/*User Story 1] Create a Class to Subtract Two Decimal Values, to Multiply to Integer Values and to Concatenate First Name and Last Name.*/
public class practice {

    public static decimal substrack(decimal x, decimal y){
        
        decimal substract = x - y;
        return substract;
        
    }
    
    public static integer multiply(integer a, integer b){
        integer multiplication = a*b;
        return multiplication;
        
    }
    
    public static string concatenet(string FirstName, string LastName){
        
        string Name = FirstName+ '' +LastName;
        return Name;
        
    }
}