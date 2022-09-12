import { LightningElement,api,track,wire} from 'lwc';
import getRec from '@salesforce/apex/tableCreationRecord.getRecords';
import getAccId from '@salesforce/apex/getAccountId.getAccId';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';



// const FIELDS = [
//     'Contact.firstName',
//     'Contact.LastName',
//     'Contact.Email'
// ];


export default class tableRecordCreation extends LightningElement {
    @api recordId;



    @wire(getAccId,{accountId: '$recordId'})
    relContact({error,data}){
        if(data){
            console.log('dsfs====>'+JSON.stringify(data));

            this.accRecord =data
        }else{
            console.log('erro=====>'+JSON.stringify(error))
        }
    }


    @wire (getRec, { recordId: '$recordId' })
    contact({error,data}){
        if(data){
            this.accRecord = data
            console.log(data);
        }else{
            console.log('erro=====>'+JSON.stringify(error))
        }
        
    }

    @track error;
    @track accRecord = [];
    
    pushRecord(){
        console.log('pushRecordddddd12344');
        let obj = [];
        
        console.log('push56789'+JSON.stringify(this.obj));
        for(let x of this.accRecord){
            obj.push(x);
        }
        obj.push({
            Id : null,
            FirstName : null,
            LastName : null,
            Email : null
        });
        //this.accRecord= [];
        this.accRecord = obj;
        console.log('pushRecordddddd56789');
        this.accRecord = obj;
        console.log('pushRecordddddd');

    }

    firstnameHandler(event)
    {
        console.log('Hello Firstname')
        let index = event.target.dataset.index;
        this.accRecord[index].FirstName = event.target.value;
        console.log(index);
    }

    lastnameHandler(event)
    {
        console.log('Hello Lastname')
        let index = event.target.dataset.index;
        this.accRecord[index].LastName = event.target.value;
        console.log(index);    
    }
    
    emailHandler(event)
    {
        console.log('Hello Email')
        let index = event.target.dataset.index;
        this.accRecord = JSON.parse(JSON.stringify(this.accRecord))
        console.log(index);  
        console.log(JSON.stringify(this.accRecord[index])); 
         
       // this.accRecord[index] = {...this.accRecord[index], Email: event.target.value}
        this.accRecord[index]['Email'] = event.target.value; 
        console.log(JSON.stringify(this.accRecord[index])); 
         
        
    }

    isInputValid() {
        let isValid = true;
        let inputFields = this.template.querySelectorAll('.validate');
        inputFields.forEach(inputField => {
            if(!inputField.checkValidity()) {
                inputField.reportValidity();
                isValid = false;
            }
            this.contact[inputField.name] = inputField.value;
        });
        return isValid;
    }

    upsertHandler(){
        console.log('Ssddd' +JSON.stringify(this.accountId));
        getAccId({accountId:JSON.stringify(this.accountId)})
        .then(result => {
            // Clear the user enter values
           // this.accRecord = {};

            window.console.log('result ===> '+JSON.stringify(result));
            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Contact Created Successfully!!',
                variant: 'success'
            }),);
        })
        .catch(error => {
            this.error = error.message;
        });
    
        
    }

    handleSave() {
        console.log('execute1+'+JSON.stringify(this.accRecord)); 
        
        getRec({accCon:JSON.stringify(this.accRecord)})
        
        .then(result => {
            // Clear the user enter values
          //  this.accRecord = {};

            window.console.log('result ===> '+result);

            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Account Created Successfully!!',
                variant: 'success'
            }),);
        })
        .catch(error => {
            this.error = error.message;
        });
    }

    
}