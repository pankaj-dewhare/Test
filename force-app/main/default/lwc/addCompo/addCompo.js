import { LightningElement, api } from 'lwc';


const columns = [
    { label: 'Address ID', fieldName: 'Name', editable: true },
    { label: 'Country', fieldName: 'Country__c', editable: true },
    { label: 'State', fieldName: 'State__c', editable: true },
    { label: 'City', fieldName: 'City__c', editable: true }
  ];
  
export default class AddCompo extends LightningElement {

    @api addressList;
    columns = columns
   @api totalRecords
}