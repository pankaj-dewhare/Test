import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import applicantRecordShowMethod from '@salesforce/apex/ApplicantProvider7.applicantRecordShowMethod'
export default class ApplicantForm8 extends LightningElement {

    applicantObj={'sObjectType':'Applicant__c'}
    showSpinnerFlag = false

    searchButtonHandler(){
        this.showSpinnerFlag = true
        this.applicantObj.Name = this.template.querySelector('lightning-input[data-formfield="appName"]').value
        console.log('value='+this.applicantObj.Name)

        applicantRecordShowMethod({objApp:this.applicantObj})

        .then(result=>{
         console.log('result='+JSON.stringify(result))
         this.applicantObj = result
         this.showSpinnerFlag = false
         this.showSuccessToast();
        })

        .catch(error=>{
         console.log('error='+JSON.stringify(error))
         this.showSpinnerFlag = false
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