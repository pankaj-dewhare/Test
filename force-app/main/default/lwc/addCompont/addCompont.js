import { LightningElement, api } from 'lwc';
import deleteAddRecords from '@salesforce/apex/AddressProvider.deleteAddRecords'

const columns = [
    { label: 'Address Id', fieldName: 'Name', editable: true },
    { label: 'Country', fieldName: 'Country__c', editable: true },
    { label: 'State', fieldName: 'State__c', editable: true },
    { label: 'City', fieldName: 'City__c', editable: true }
  ];
export default class AddCompont extends LightningElement {
  @api addressList;
  columns = columns
  selectedRecordCount = 0
  selectedRecordsList

  deleteButtonHandler(){
    console.log('I am delete from child')

    deleteAddRecords({deleteRecordsList : this.selectedRecordsList})
    .then(result=>{
console.log('result='+JSON.stringify(result))
this.addressList = result
    })

    .catch(error=>{
console.log('error='+JSON.stringify(error))
    })

  }

  selectedRecordsHandler(event){
    const selectedRows  =   event.detail.selectedRows;
    console.log("Selected Rows = "+selectedRows);
    this.selectedRecordCount = event.detail.selectedRows.length;

    let recordsSets = new Set();

    // getting selected record id
    for (let index = 0; index < selectedRows.length; index++) {
        recordsSets.add(selectedRows[index].Id);
    }

    // coverting to array
    this.selectedRecordsList = Array.from(recordsSets);
  }


}