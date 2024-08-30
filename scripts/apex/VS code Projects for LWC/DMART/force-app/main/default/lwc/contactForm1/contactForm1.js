import { LightningElement } from 'lwc';
import contactCreation from '@salesforce/apex/ContactProvider1.contactCreation'
export default class ContactForm1 extends LightningElement {

firstName
lastName
emailId

    handleSubmitButton(){
        console.log(' i am handle submit button');

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value;
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value;
        this.emailId = this.template.querySelector('lightning-input[data-formfield="email"]').value;

        contactCreation({ firstName : this.firstName, lastName : this.lastName, emailId : this.emailId})

        .then(result=>{
console.log('Record has been created')
        })
        .catch(error=>{
console.log('Something went wrong')
        })


    }
}