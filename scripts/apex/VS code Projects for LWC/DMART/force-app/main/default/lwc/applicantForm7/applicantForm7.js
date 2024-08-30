import { LightningElement } from 'lwc';
import applicantCreationMethod from '@salesforce/apex/ApplicantProvider7.applicantCreationMethod'
export default class ApplicantForm7 extends LightningElement {

    applicantObject={'sObjectType':'Applicant__c'}

    handleSubmitButton(){
        console.log('Pressed submit button' )

        this.applicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.applicantObject.Last_Name__c = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        this.applicantObject.Email__c = this.template.querySelector('lightning-input[data-formfield="emal"]').value
        this.applicantObject.Adhar_Number__c = this.template.querySelector('lightning-input[data-formfield="aNumb"]').value

        applicantCreationMethod({objApp:this.applicantObject})

        .then(result=>{
console.log('result='+result)
        })

        .catch(error=>{
console.log('error='+error)
        })

    }

}