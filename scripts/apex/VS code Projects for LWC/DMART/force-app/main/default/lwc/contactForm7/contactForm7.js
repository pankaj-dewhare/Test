import { LightningElement } from 'lwc';
import contactCreationMethod from "@salesforce/apex/ContactProvider7.contactCreationMethod"
export default class ContactForm7 extends LightningElement {


    firstName
    lastName
    emailId

    handleSubmitButton(){
        console.log('I am in JS')

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        console.log('First Name value='+this.firstName);
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        console.log('Last Name value='+this.lastName);
        this.emailId = this.template.querySelector('lightning-input[data-formfield="emal"]').value
        console.log('Email ID value='+this.emailId);

        contactCreationMethod({frstName:this.firstName, lstName:this.lastName, eml:this.emailId})

        .then(result=>{
console.log('result='+result)
        })

        .catch(error=>{
console.log('error='+error)
        })
    }
}