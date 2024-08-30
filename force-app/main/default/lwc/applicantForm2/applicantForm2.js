import { LightningElement } from 'lwc';
import applicantCreation from '@salesforce/apex/ApplicantProvider1.applicantCreation'
export default class ApplicantForm2 extends LightningElement {

    applicantObject = {'sObjectType':'Applicant__c'}


    handleSubmitButton(){

        this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.applicantObject.Last_Name__c = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        this.applicantObject.Email__c = this.template.querySelector('lightning-input[data-formfield="emailId"]').value
        this.applicantObject.Adhar_Number__c = this.template.querySelector('lightning-input[data-formfield="adhar"]').value

        applicantCreation({objApp : this.applicantObject})

        .then(result=>{
console.log('Result='+result)
        })
        .catch(error=>{
console.log('Error='+error)
        })
    }
}