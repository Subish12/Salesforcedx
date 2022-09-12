import { LightningElement,track,wire } from 'lwc';
import showProducts from '@salesforce/apex/searchClass.showProducts';
import { refreshApex } from '@salesforce/apex';

export default class SearchComponent extends LightningElement {
    @track page = 1; //this will initialize 1st page
    @track items = []; //it contains all the records.
    //@track data = []; //data to be displayed in the table
    @track columns; //holds column info.
    @track startingRecord = 1; //start record position per page
    @track endingRecord = 0; //end record position per page
    @track pageSize = 5; //default value we are assigning
    @track totalRecountCount = 0; //total record count received from all retrieved records
    @track totalPage = 0;
    
    @track searchData1=[];
    @track strSearchProdName;    

   
    
        
    @wire(showProducts,{strSearchProdName:'strProdName'})
    getData({ data,error }) {
        if (data) {
            this.items = data;
            this.totalRecountCount = data.length;
            this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize);
            this.data = this.items.slice(0,this.pageSize); 
            this.endingRecord = this.pageSize;
            this.columns = columns;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }

    previousHandler() {
        console.log('previous');
        if (this.page > 1) {
            console.log(this.page);
            this.page = this.page - 1; //decrease page by 1
            this.displayRecordPerPage(this.page);
        }
    }

    nextHandler() {
        console.log('next');
        if((this.page<this.totalPage) && this.page !== this.totalPage){
            console.log('next111');
            this.page = this.page + 1; //increase page by 1
            this.displayRecordPerPage(this.page);            
        }             
    }

    displayRecordPerPage(page){
        this.startingRecord = ((page -1) * this.pageSize) ;
        this.endingRecord = (this.pageSize * page);

        this.endingRecord = (this.endingRecord > this.totalRecountCount) 
                            ? this.totalRecountCount : this.endingRecord; 

        this.searchData1 = this.items.slice(this.startingRecord, this.endingRecord);
        this.startingRecord = this.startingRecord + 1;

    }

    handleProductName(event) {
            
        this.strSearchProdName= event.detail.value;
        if(this.strSearchProdName.length>=3){
            showProducts({strProdName : this.strSearchProdName})
            .then(result => {
            this.searchData1 = result;                
        }) 
        refreshApex(this.getData);
        console.log('Method---1')
        this.previousHandler();
        console.log('Method---2')
        this.nextHandler();
        console.log('Method---3')
        this.displayRecordPerPage();
        console.log('Method---4')
        };      
}

  
}