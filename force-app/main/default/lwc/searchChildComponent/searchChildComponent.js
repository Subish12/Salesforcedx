import { LightningElement,api,track } from 'lwc';
const columns = [
    {
        label: 'Name',
        fieldName: 'Name',
        type: 'url',
        typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}
    }, {
        label: 'Product Code',
        fieldName: 'ProductCode',
        type: 'text',
    }
    ];


export default class SearchChildComponent extends LightningElement {
    @api searchData;
    @track columns = columns;
    @api strSearchProdName;

    previousHandler() {
        this.dispatchEvent(new CustomEvent('previous'));
    }

    nextHandler() {
        this.dispatchEvent(new CustomEvent('next'));
    }
}