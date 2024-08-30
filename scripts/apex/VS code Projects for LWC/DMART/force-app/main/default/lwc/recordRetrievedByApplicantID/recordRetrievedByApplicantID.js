import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import fetchingApplicantRecord from '@salesforce/apex/applicantProvider.fetchingApplicantRecord'
export default class RecordRetrievedByApplicantID extends LightningElement {

applicantObject = {'sObjectType':'Applicant__c'}
showSpinnerFlag = false;

    handleSearchButton(){
      this.showSpinnerFlag = true;
      this.applicantObject.Name =  this.template.querySelector('lightning-input[data-formfield="appId"]').value;
      
      fetchingApplicantRecord({"objApp" : this.applicantObject})

      .then(result=>{
    console.log('Result='+JSON.stringify(result));
    this.applicantObject = result
    this.showSpinnerFlag = false;
    this.showSuccessToast();

      })
      .catch(error=>{
console.log('error='+JSON.stringify(error));
this.showSpinnerFlag = false;
      })

    }
    showSuccessToast() {
      const evt = new ShowToastEvent({
          title: 'Message',
          message: 'Record Found...!!!',
          variant: 'success',
          mode: 'dismissable'
      });
      this.dispatchEvent(evt);
  }



}