import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import TYPE_FIELD from '@salesforce/schema/Account.Type'

const fields = [TYPE_FIELD]
export default class AccTypeCompo extends LightningElement {

    //Print “In Progress” if Current Account Type is “Prospect”. “Closed” for Type Otherwise.

    @api recordId
    typeFlag = false

    @wire(getRecord, { recordId: '$recordId', fields })
    account;

    get type(){

        if(getFieldValue(this.account.data, TYPE_FIELD) == 'Prospect'){
        this.typeFlag = true
        }
        else{
            this.typeFlag = false
        }
        return getFieldValue(this.account.data, TYPE_FIELD);
    }

}