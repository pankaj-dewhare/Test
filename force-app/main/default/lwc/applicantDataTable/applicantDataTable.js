import { LightningElement } from 'lwc';
import applicantDataTableRecord from '@salesforce/apex/ApplicantProvider1.applicantDataTableRecord'
import selectedDeleteRecords from '@salesforce/apex/ApplicantProvider1.selectedDeleteRecords'

const applicantColumns = [
    { label: 'Applicant Id', fieldName: 'Name', editable: true },
    { label: 'First Name', fieldName: 'First_Name__c', editable: true },
    { label: 'Last_Name__c', fieldName: 'Last_Name__c', editable: true },
    { label: 'Created Date', fieldName: 'CreatedDate', editable: true }
  ];
  
export default class ApplicantDataTable extends LightningElement {

    selectedRecords = 0
    applicantObject={'sobjectType' : 'Applicant__c'}
    appList
    draftValues=[];
    columns = applicantColumns
    selectedRecordsList
    


    handleKeyupFunction(){
console.log('I am handle key up function')

this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="appName"]').value
console.log('Values are from input field='+this.applicantObject.First_Name__c)

applicantDataTableRecord({objApp : this.applicantObject})
.then(result=>{
console.log('result='+JSON.stringify(result))
this.appList = result
})

.catch(error=>{
    console.log('Error ='+JSON.stringify(error))
})

    }

    handleDeleteButton(){
console.log('I am handle delete button')

selectedDeleteRecords({appIdList : this.selectedRecordsList, objApp : this.applicantObject})
.then(result =>{
console.log('result='+JSON.stringify(result))
this.appList = result;
})
.catch(error=>{
console.log('error='+JSON.stringify(error))
})
    }

    selectedRecordsHandler(event){
        const selectedRows  =   event.detail.selectedRows;
        console.log("Selected Rows = "+selectedRows)
        this.selectedRecords = event.detail.selectedRows.length;
  
        let recordsSets = new Set();
  
        // getting selected record id
        for (let i = 0; i < selectedRows.length; i++) {
            recordsSets.add(selectedRows[i].Id);
        }
  
        // coverting to array
        this.selectedRecordsList = Array.from(recordsSets);
      }
  

}