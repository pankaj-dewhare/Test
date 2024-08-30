import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ; 
import showRecordIdMethoddName from '@salesforce/apex/ApplicantProviderNew.showRecordIdMethoddName'
export default class ApplicantForm6 extends LightningElement {

    applicantObject={'sObject' : 'Applicant__c'}

    showHandlerButton(){

        this.applicantObject.Name = this.template.querySelector('lightning-input[data-formfield="appId"]').value

        showRecordIdMethoddName({objApp : this.applicantObject})

        .then(result=>{
            console.log('Record has been shown')
            this.applicantObject = result;
            this.showSuccessToast(); 
        })
        .catch(error=>{
            console.log('Something went wrong')
        })
    }

    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Shown...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }


}