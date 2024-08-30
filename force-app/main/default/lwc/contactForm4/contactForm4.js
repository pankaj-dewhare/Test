import { LightningElement, track } from 'lwc';
import contactCreationMethod from '@salesforce/apex/contactProvider_4.contactCreationMethod'
export default class ContactForm4 extends LightningElement {

    contactObject={'sObject':'Contact'}

    submitButtonHandler(){

    this.contactObject.FirstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
    this.contactObject.LastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
    this.contactObject.Email = this.template.querySelector('lightning-input[data-formfield="eml"]').value

    contactCreationMethod({objCon : this.contactObject})

    .then(result=>{
        console.log('Result='+result)
    })
    .error(error=>{
        console.log('Result='+result)
    })
    }
}