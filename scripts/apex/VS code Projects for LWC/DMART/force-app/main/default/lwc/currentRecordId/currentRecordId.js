//User Story 1] Get Account Type and SLA of Current Record.
import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import TYPE_FIELD from '@salesforce/schema/Account.Type';
import SLA_FIELD from '@salesforce/schema/Account.SLA__c';

const fields = [TYPE_FIELD, SLA_FIELD];

export default class CurrentRecordId extends LightningElement {


    @api recordId
    @wire(getRecord,{recordId: '$recordId', fields})
    account;

    get type() {
        return getFieldValue(this.account.data, TYPE_FIELD);
      }

      get sla() {
        return getFieldValue(this.account.data, SLA_FIELD);
      }

}