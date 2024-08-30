import { LightningElement, api, wire } from 'lwc';
import getAccountTypeAndRating from '@salesforce/apex/AccountProvider.getAccountTypeAndRating'
export default class AccountRecordCompo extends LightningElement {

    accountObject={'sObjectType' : 'Account'}

    @api recordId

    @wire(getAccountTypeAndRating, {objAcc : '$accountObject'}) accountList;
}