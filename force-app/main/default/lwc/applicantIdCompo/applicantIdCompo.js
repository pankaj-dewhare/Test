import { LightningElement } from 'lwc';
import applicantIdFetch from '@salesforce/apex/ApplicantProvider1.applicantIdFetch'
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
export default class ApplicantIdCompo extends LightningElement {


    applicantObject={'sObjectType':'Applicant__c'}
    showSpinnerFlag = false;

    handleSearchButton(){
       this.showSpinnerFlag = true;
        console.log('I am in JS Method')

        this.applicantObject.Name = this.template.querySelector('lightning-input[data-formfield="appId"]').value
        console.log('name value ='+this.applicantObject.Name)

        applicantIdFetch({objApp : this.applicantObject})

        .then(result=>{
         console.log('result='+JSON.stringify(result))
         this.applicantObject = result
         this.showSpinnerFlag = false;
         this.showSuccessToast();
        })

        .catch(error=>{
         console.log('error ='+JSON.stringify(error))
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