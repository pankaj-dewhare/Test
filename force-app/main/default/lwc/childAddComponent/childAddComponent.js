import { LightningElement, api } from 'lwc';

const columns = [
   { label: 'Applicant Id', fieldName: 'Name', editable: true },
   { label: 'Country', fieldName: 'Country__c', editable: true },
   { label: 'State', fieldName: 'State__c', editable: true },
   { label: 'City', fieldName: 'city__c', editable: true }
 ];

export default class ChildAddComponent extends LightningElement {
@api addressList

   columns = columns

 
}