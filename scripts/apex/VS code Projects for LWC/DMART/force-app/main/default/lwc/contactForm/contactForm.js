//Create a new Contact. (First Name, Last Name, Email ID).
import { LightningElement } from 'lwc';
import createNewContact from '@salesforce/apex/ContactProvider.createNewContact'
export default class ContactForm extends LightningElement {

    contactObject = ({'sObjectType':'Contact'})
    

    handleSubmitButton(){
        console.log('Yes i am in JS method')


        this.contactObject.FirstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.contactObject.LastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        this.contactObject.Email = this.template.querySelector('lightning-input[data-formfield="emailId"]').value

        console.log(('First Name =')+this.firstName+  ('Last Name=')+this.lastName+ ('EmailId =')+this.email)

        createNewContact({objCon :  this.contactObject})

        .then(result=>{
console.log('Result='+result)
        })

        .catch(error=> {
console.log('Error ='+error)
        })


    }
}