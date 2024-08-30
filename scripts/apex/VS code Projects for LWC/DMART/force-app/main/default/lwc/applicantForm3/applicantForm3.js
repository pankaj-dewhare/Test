import { LightningElement } from 'lwc';

export default class ApplicantForm3 extends LightningElement {

    firstName; 
    lastName;
    cNumber;
    emailId; 
    addresses;

    handleShowButton(){

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value ;
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value ;
        this.cNumber = this.template.querySelector('lightning-input[data-formfield="cNum"]').value ;
        this.emailId = this.template.querySelector('lightning-input[data-formfield="email"]').value ;
        this.addresses = this.template.querySelector('lightning-input[data-formfield="adr"]').value ;


    }
}