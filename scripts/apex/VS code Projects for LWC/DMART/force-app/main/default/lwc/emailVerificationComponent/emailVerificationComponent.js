import { LightningElement, api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import EmailVerificationIntegrationClassMethod from '@salesforce/apex/EmailVerificationIntegrationClass.EmailVerificationIntegrationClassMethod'
export default class EmailVerificationComponent extends LightningElement {

    @api recordId

    verifyButtonHandler(){

        EmailVerificationIntegrationClassMethod({accId:this.recordId})

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