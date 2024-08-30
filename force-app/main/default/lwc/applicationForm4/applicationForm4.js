import { LightningElement, track } from 'lwc';

export default class ApplicationForm4 extends LightningElement {

 @track firstName;
 @track  lastName;
 @track  mobileNo;
 @track  email
 @track  adresses

    handleShowButton(){

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value 
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value 
        this.mobileNo = this.template.querySelector('lightning-input[data-formfield="mNumber"]').value 
        this.email = this.template.querySelector('lightning-input[data-formfield="mail"]').value 
        this.adresses = this.template.querySelector('lightning-input[data-formfield="adr"]').value 
    }
}