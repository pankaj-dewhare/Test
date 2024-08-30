import { LightningElement } from 'lwc';

export default class ContactForm extends LightningElement {

    firstName
    lastName
    emailId

    submitButtonHandler(){
        console.log('I am in JS ');

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        console.log('value='+this.firstName)
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        console.log('value='+this.lastName)
        this.emailId = this.template.querySelector('lightning-input[data-formfield="emal"]').value
        console.log('value='+this.emailId)
    }
}