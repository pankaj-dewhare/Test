import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import dataHandleMethod from '@salesforce/apex/ApplicantProviderNew.dataHandleMethod'
import deleteRecordMethod from '@salesforce/apex/ApplicantProviderNew.deleteRecordMethod'
const columns = [
    { label: 'Id', fieldName: 'Name', editable: true },
    { label: 'First Name', fieldName: 'First_Name__c', editable: true },
    { label: 'Last Name', fieldName: 'Last_Name__c', editable: true },
    { label: 'Gender', fieldName: 'Gender__c', editable: true }
  ];
export default class DataTableHandlingCompo extends LightningElement {

    applicantObject={'sObjectType':'Applicant__c'}

    selectedRecordCount = 0;
    firstName
    appList
    selectedRecordsList
    draftValues=[];
    columns = columns;
    showSpinnerFlag = false
    showTableFlag = false

    handleOnKeyUp(){

        this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="appName"]').value

        dataHandleMethod({objApp: this.applicantObject})

        .then(result=>{
         console.log('result='+JSON.stringify(result))
         this.appList = result
         this.showTableFlag = true

        })

        .catch(error=>{
         console.log('error='+JSON.stringify(error))
         this.showTableFlag = false

        })

    }

    handleDeleteButton(){
        this.showSpinnerFlag = true

        deleteRecordMethod({appIdList : this.selectedRecordsList, objApp : this.applicantObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.appList = result
        this.showSpinnerFlag = false
        this.showWarningToast()
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })

    }

    showWarningToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Is Deleted...!!!',
            variant: 'warning',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }



    selectedRecordsHandler(event){
        const selectedRows  =   event.detail.selectedRows; // Took selected records in event by using event.detail.selectedRows
        console.log("Selected Rows = "+selectedRows);
        this.selectedRecordCount = event.detail.selectedRows.length; // by this shown a selected record length
  
        let recordsSets = new Set(); // created a new set
  
        // getting selected record id
        for (let index = 0; index < selectedRows.length; index++) {
            recordsSets.add(selectedRows[index].Id);
        }
  
        // coverting to array
        this.selectedRecordsList = Array.from(recordsSets);
      }
}