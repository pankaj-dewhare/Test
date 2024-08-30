import { LightningElement } from 'lwc';
import applicantRecordCreation from '@salesforce/apex/ApplicantClass.applicantRecordCreation'
export default class BasicApplicantCompo extends LightningElement {

     applicantObject={'sObjectType' : 'Applicant__c'}   
   
     handleSubmitButton(){
    this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="fName"]').value
    this.applicantObject.Last_Name__c = this.template.querySelector('lightning-input[data-formfield="lName"]').value
    this.applicantObject.Email__c = this.template.querySelector('lightning-input[data-formfield="eml"]').value
    this.applicantObject.Adhar_Number__c = this.template.querySelector('lightning-input[data-formfield="adharNumb"]').value

    applicantRecordCreation({objApp : this.applicantObject})

    .then(result=>{
console.log('result='+result)
    })
    .catch(error=>{
console.log('error='+error)
    })
    }
}