import { LightningElement, api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import integrationMobileVerifyMethod from '@salesforce/apex/mobileVerificationIntegrationClass.integrationMobileVerifyMethod'


export default class MobileVerificationCompo extends LightningElement {

    @api recordId

    handleVerifyButton(){

        integrationMobileVerifyMethod({contactId : this.recordId})

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