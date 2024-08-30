import { LightningElement } from 'lwc';
import newContactCreationMethod from '@salesforce/apex/ContactProvider7.newContactCreationMethod'
export default class ContactForm5 extends LightningElement {

    contactObject={'sObjectType':'Contact'}

    saveButtonHandler(){
        console.log('I am save button');

        this.contactObject.FirstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        console.log('First Name ='+this.contactObject.FirstName)
        this.contactObject.LastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        console.log('Last Name='+this.contactObject.LastName)

        newContactCreationMethod({objCon : this.contactObject})

        .then(result=>{
        console.log('result='+result)
        })

        .catch(error=>{
        console.log('error='+error)
        })
    }
}