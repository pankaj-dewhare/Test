import { LightningElement, wire } from 'lwc';
import getAccountJuhiRecords from '@salesforce/apex/AccountProvider1.getAccountJuhiRecords'
export default class JuhiRecordCompo extends LightningElement {

    accountObject={'sObjectType' : 'Account'}

    @wire(getAccountJuhiRecords, {objAcc : '$accountObject'}) accountList
}