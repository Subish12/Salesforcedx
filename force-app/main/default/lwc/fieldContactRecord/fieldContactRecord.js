import { LightningElement} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.LastName';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';

export default class FieldContactRecord extends LightningElement {
  

    selectedFields=[NAME_FIELD,ACCOUNTID_FIELD];
}