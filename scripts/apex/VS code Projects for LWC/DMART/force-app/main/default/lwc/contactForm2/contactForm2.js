import { LightningElement } from 'lwc';
import contactCreation from '@salesforce/apex/ContactProvider2.contactCreation'
export default class ContactForm2 extends LightningElement {

    firstName;
    lastName;
    email;



    handleSubmitButton(){

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        this.email = this.template.querySelector('lightning-input[data-formfield="eml"]').value

        contactCreation({frstName : this.firstName, lstName : this.lastName, emal : this.email})

        .then(result=>{
console.log('Record has been created');
        })

        .catch(error=>{
console.log('Something went wrong');
        })

    }
}