import { LightningElement, api } from 'lwc';

const columns = [
    { label: 'Applicant Id', fieldName: 'Name', editable: true },
    { label: 'Country', fieldName: 'Country__c', editable: true },
    { label: 'State', fieldName: 'State__c', editable: true },
    { label: 'City', fieldName: 'City__c', editable: true }
  ];
export default class AddressCompo1 extends LightningElement {


    @api addresslist
    columns = columns

    
      
}