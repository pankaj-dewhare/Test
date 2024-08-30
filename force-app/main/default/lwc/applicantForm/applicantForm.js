// Create a new Applicant. (First Name, Last Name, Email Id, Aadhar Card).
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createNewApplicant from '@salesforce/apex/applicantProvider.createNewApplicant'
export default class ApplicantForm extends LightningElement {


    applicantObject = ({'sObjectType':'Applicant__c'})
    showSpinnerFlag = false;

    handleSubmitButton(){
        console.log('I am in JS method')
        this.showSpinnerFlag = true;


        this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="firstName"]').value
        this.applicantObject.Last_Name__c = this.template.querySelector('lightning-input[data-formfield="lastName"]').value
        this.applicantObject.Email__c = this.template.querySelector('lightning-input[data-formfield="email"]').value
        this.applicantObject.Adhar_Number__c = this.template.querySelector('lightning-input[data-formfield="adharCard"]').value

        createNewApplicant({objApp : this.applicantObject})

        
.then(result=>{
console.log('Result='+result)
this.showSpinnerFlag = false;
this.showSuccessToast();


})
.catch(error=>{
console.log('Error='+error)
this.showSpinnerFlag = false;
})
    }
    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Created...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    

}