import { LightningElement } from 'lwc';

export default class ApplicantNameCompo extends LightningElement {

   
firstName
lastName
contactNumb
email
addr

submitButtonHandler(){

    this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
    this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
    this.contactNumb = this.template.querySelector('lightning-input[data-formfield="cNumber"]').value
    this.email = this.template.querySelector('lightning-input[data-formfield="eml"]').value
    this.addr = this.template.querySelector('lightning-input[data-formfield="add"]').value



    }
}