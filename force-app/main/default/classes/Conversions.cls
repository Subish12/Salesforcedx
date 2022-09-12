public class Conversions {
    
    public static void string_Integer(String str,Integer i){
        Integer int1=Integer.valueOf(str);
        system.debug('Integer_Conversion:' +int1);
         String s=String.valueOf(i);
        system.debug('String_Conversion:' +s);   
    }    
}