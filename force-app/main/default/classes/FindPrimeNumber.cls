public class FindPrimeNumber {
	 public static void getPrime(){
         integer x=0;
    for(x=0;x<100;x++)
    {
        integer count=0;
		integer y=0;
        for( y=x; y>=1;y--)
        {
            
            if(math.mod(x,y)==0 )
            {
                count++;
            }
        }
        if(count==2 || count==1){
            
                         system.debug('Prime Number is' +x);
                   
                }                     
                 
            else{
                system.debug('This is not prime number ');      
                }
    }
  }

}