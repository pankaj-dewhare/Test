import { LightningElement, api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import EmailVerificationIntegrationMethod from '@salesforce/apex/MobileVerificationIntegration.EmailVerificationIntegrationMethod'
export default class LeadMobileVerificationCompo extends LightningElement {

    @api recordId

    verifyButtonHandler(){

        EmailVerificationIntegrationMethod({'leadId':this.recordId})

        .then(result=>{
            this.dispatchEvent(new CloseActionScreenEvent());
            window.location.reload(); 
        })

        .catch(error=>{
            this.dispatchEvent(new CloseActionScreenEvent());
            window.location.reload(); 
        })
    }

}