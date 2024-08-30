import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import contactCreationMethod from '@salesforce/apex/CntProvider.contactCreationMethod'
export default class BasicContactCompo extends LightningElement {


    fName
    lName
    email
    showSpinnerFlag = false

    handleSubmitButton(){
        this.showSpinnerFlag = true
    this.fName = this.template.querySelector('lightning-input[data-formfield="firstName"]').value
    this.lName = this.template.querySelector('lightning-input[data-formfield="lastName"]').value
    this.email = this.template.querySelector('lightning-input[data-formfield="email"]').value

    contactCreationMethod({frstName : this.fName, lstName : this.lName, emil :  this.email})

    .then(result=>{
    console.log('result='+result)
       this.showSuccessToast()
       this.showSpinnerFlag = false
    })
    .catch(error=>{
    console.log('error='+error)
    this.showSpinnerFlag = false
    })
    }

    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record is Created...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

}