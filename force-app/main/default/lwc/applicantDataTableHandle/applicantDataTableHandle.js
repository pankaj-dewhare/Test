import { LightningElement } from 'lwc';
import appLicantRecordShown from '@salesforce/apex/ApplicantProvider3.appLicantRecordShown'
import arrayIdPassMethod from '@salesforce/apex/ApplicantProvider3.arrayIdPassMethod'
const columns = [
    { label: 'Applicant Id', fieldName: 'Name', editable: true },
    { label: 'First Name', fieldName: 'First_Name__c', editable: true },
    { label: 'Last Name', fieldName: 'Last_Name__c', editable: true },
    { label: 'Created Date', fieldName: 'CreatedDate', editable: true }
  ];
  
export default class ApplicantDataTableHandle extends LightningElement {

    applicantObject={'sObjectType' : 'Applicant__c'}
    selectedRecordCount = 0
    appList;
    draftValues=[];
    columns = columns
    selectedRecordsList

    keyUpHandler(){
    this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="appName"]').value
    console.log(this.applicantObject.First_Name__c)

    appLicantRecordShown({objApp : this.applicantObject})

    .then(result=>{
     console.log('result='+JSON.stringify(result))
     this.appList = result
    })

    .catch(error=>{
        console.log('error='+JSON.stringify(error))
    })

    }

    handleDeleteButton(){

        arrayIdPassMethod({appIdList : this.selectedRecordsList})

        .then(response=>{
console.log('response='+JSON.stringify(response))
this.appList = response
        })

        .catch(issue=>{
console.log('issue='+JSON.stringify(issue))
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