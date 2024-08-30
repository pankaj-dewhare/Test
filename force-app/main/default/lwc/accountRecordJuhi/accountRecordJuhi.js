import { LightningElement, wire } from 'lwc';
import getAccountJuhi from '@salesforce/apex/AccountProvider.getAccountJuhi'
export default class AccountRecordJuhi extends LightningElement {

    accountObject={'sObjectType' : 'Account'}

    @wire(getAccountJuhi, {objAcc : '$accountObject'}) accList;
}