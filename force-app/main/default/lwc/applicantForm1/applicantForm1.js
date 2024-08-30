import { LightningElement } from 'lwc';

export default class ApplicantForm1 extends LightningElement {

    fName
    lName
    cNumber
    eml
    add
    
    handleShowButton(){
        console.log('I am JS method')

        this.fName = this.template.querySelector('lightning-input[data-formfield="appName"]').value
        console.log(this.fName)
        this.lName = this.template.querySelector('lightning-input[data-formfield="lstName"]').value
        console.log(this.lName)
        this.cNumber = this.template.querySelector('lightning-input[data-formfield="contactNu"]').value
        console.log(this.cNumber)
        this.eml = this.template.querySelector('lightning-input[data-formfield="emailId"]').value
        console.log(this.eml)
        this.add = this.template.querySelector('lightning-input[data-formfield="address"]').value
        console.log(this.add)

    }
}