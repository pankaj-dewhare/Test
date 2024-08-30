import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import applicantSearchMethod from '@salesforce/apex/ApplicantProvider3.applicantSearchMethod'
export default class ApplicantForm5 extends LightningElement {

    
    objApplicant={'sObjectType' : 'Applicant__c'}
 
    showSpinnerFlag = false
    handleSearchButton(){

        this.showSpinnerFlag = true
        this.objApplicant.Name = this.template.querySelector('lightning-input[data-formfield="appId"]').value


        applicantSearchMethod({objApp : this.objApplicant})

        .then(result=>{
console.log('result='+JSON.stringify(result))
this.objApplicant = result
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