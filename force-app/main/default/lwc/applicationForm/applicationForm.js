import { LightningElement } from 'lwc';

export default class ApplicationForm extends LightningElement {

    firstName
    lastName
    contactNo
    emailId
    address

    handleButton(){
        
        console.log('Yes')

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fname"]').value
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lname"]').value
        this.contactNo = this.template.querySelector('lightning-input[data-formfield="mobile"]').value
        this.emailId = this.template.querySelector('lightning-input[data-formfield="email"]').value
        this.address = this.template.querySelector('lightning-input[data-formfield="addr"]').value
    }
}