public with sharing class searchClass {
   @AuraEnabled(cacheable=true)
   public static list<Product2> showProducts(String strProdName){
       try {
        strProdName = '%' + strProdName + '%';
        List<Product2> lstProd = [SELECT  Id, Name FROM Product2 WHERE Name LIKE :strProdName limit 100];
        return lstProd; 
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
   }
}