import { LightningElement } from 'lwc';
import recordShownByOnkeyupMethod from '@salesforce/apex/ApplicantProvider5.recordShownByOnkeyupMethod'

const applicantColumns = [
    { label: 'Id', fieldName: 'Name', editable: true },
    { label: 'First Name', fieldName: 'First_Name__c', editable: true },
    { label: 'Last Name', fieldName: 'Last_Name__c', editable: true },
    { label: 'Gender', fieldName: 'Gender__c', editable: true },
    { label: 'DOB', fieldName: 'DOB__c', editable: true },
    
  ];
  
export default class SearchRecordAndDeleteComponent extends LightningElement {


    applicantObject={'Applicant__c' : 'Applicant__c'}
    selectedRecordCount = 0
    appList
    columns = applicantColumns;


    handleOnKeyUp(){

        this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="appName"]').value

        recordShownByOnkeyupMethod({objApp : this.applicantObject})

        .then(result=>{
         console.log('result='+JSON.stringify(result))
         this.appList = result
        })

        .catch(error=>{
         console.log('error='+JSON.stringify(error))
        })
    }

    deleteButtonHandler(){

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