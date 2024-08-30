import { LightningElement } from 'lwc';
import firstNameCreation from '@salesforce/apex/ApplicantProvider1.firstNameCreation'
import deleteSelectedRecordsMethod from '@salesforce/apex/ApplicantProvider1.deleteSelectedRecordsMethod'

const columns = [
    { label: 'Applicant Id', fieldName: 'Name', editable: true },
    { label: 'First Name', fieldName: 'First_Name__c', editable: true },
    { label: 'Last Name', fieldName: 'Last_Name__c', editable: true },
    { label: 'Created Date', fieldName: 'CreatedDate', editable: true }
  ];
  
export default class ApplicantDataTableHandling extends LightningElement {

selectedRecordCount = 0
 
applicantObject=({'sobjectType' : 'Applicant__c'})
appList
columns = columns
draftValues=[];
selectedRecordsList;
showDataTableFlag = false

    handleOnkeyup(){
console.log('I am onkeyup')

this.applicantObject.First_Name__c =  this.template.querySelector('lightning-input[data-formfield="appId"]').value
console.log('Input Value ='+this.applicantObject.First_Name__c)

   firstNameCreation({objApp : this.applicantObject})

.then(result=>{
console.log('result='+JSON.stringify(result))
 if(result.length > 0 || result.length != null || result.length == 'undefined'){
this.appList = result
this.showDataTableFlag = true;
}else{
    this.showDataTableFlag = false;
}
})

.catch(error=>{
console.log('error='+JSON.stringify(error))
})
    }

    deleteButtonHandler(){
console.log('I am delete handler')

deleteSelectedRecordsMethod({deleteList : this.selectedRecordsList, objApp : this.applicantObject})
.then(result=>{
console.log('result='+JSON.stringify(result))
if(result.length > 0 || result.length != null || result.length == 'undefined'){
this.appList = result
this.showDataTableFlag = true
}
else{
    this.showDataTableFlag = false
}
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