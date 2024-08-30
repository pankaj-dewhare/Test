import { LightningElement, track } from 'lwc';
import applicantFormMethod from '@salesforce/apex/ApplicantProviderNew.applicantFormMethod'
export default class ApplicantForm_4 extends LightningElement {

    @track firstName
    @track lastName
    @track email
    @track adharNumber


    handleSubmitButton(){

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.lastName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.email = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value

        applicantFormMethod({frstName:this.firstName, lstName:this.lastName, emal:email, })
    }
}