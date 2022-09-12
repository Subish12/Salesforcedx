public class PrimeNumbers {
    public void test(){
    for(integer i=1;i<=100;i++)
    {
        integer count=0;
        for(integer j=i; j>=1;j--)
        {
            
            if(math.mod(i,j)==0 )
            {
                count++;
            }
        }
        if(count==2 || count==1){
            
                         system.debug(i);
                   
                }                     
                 
            else{
               system.debug('no');      
                }
    }
  }

}