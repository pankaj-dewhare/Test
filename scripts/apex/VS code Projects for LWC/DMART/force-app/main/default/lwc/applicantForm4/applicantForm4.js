import { LightningElement } from 'lwc';
import applicantRecordCreation from '@salesforce/apex/ApplicantProvider3.applicantRecordCreation'
export default class ApplicantForm4 extends LightningElement {

    firstName;
    lastName;
    email;
    adharNumber;

    handleSubmitButton(){

        this.firstName = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        this.lastName = this.template.querySelector('lightning-input[data-formfield="lName"]').value
        this.email = this.template.querySelector('lightning-input[data-formfield="emal"]').value
        this.adharNumber = this.template.querySelector('lightning-input[data-formfield="adharNumb"]').value



        applicantRecordCreation({frstName : this.firstName, lstName : this.lastName, emailId : this.email, adhNumb : this.adharNumber})

        .then(result=>{
        console.log('Record has been created');
        })

        .catch(error=>{
        console.log('Error Something went wrong');
        })
    }
}