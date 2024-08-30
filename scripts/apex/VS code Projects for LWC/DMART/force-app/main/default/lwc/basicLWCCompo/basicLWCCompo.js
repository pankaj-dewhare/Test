import { LightningElement } from 'lwc';

export default class BasicLWCCompo extends LightningElement {

 firstName;
 lastName;
 mob;
 emailId;
 addresses;

 handleSubmitButton(){
    this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
    console.log(this.firstName)
    this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
    console.log(this.lastName)
    this.mob = this.template.querySelector('lightning-input[data-formfield="cNumb"]').value
    console.log(this.mobile)
    this.emailId = this.template.querySelector('lightning-input[data-formfield="emal"]').value
    console.log(this.emailId)
    this.addresses = this.template.querySelector('lightning-input[data-formfield="addr"]').value
    console.log(this.addresses)
   
 }


}