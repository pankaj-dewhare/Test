import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import AccountCreationMethod from '@salesforce/apex/AbcClass.AccountCreationMethod'
export default class AccountRecords extends LightningElement {

    accName;
    showSpinnerFlag = false
    
    
    handleSubmitButton(){
        console.log('I am submit button')
        this.showSpinnerFlag = true
    this.accName = this.template.querySelector('lightning-input[data-formfield="accountName"]').value
    console.log('value ='+this.accName)

    AccountCreationMethod({accountName : this.accName})

    .then(result=>{
console.log('Record has been created')
this.showSpinnerFlag = false
this.showSuccessToast()
    })
    
    .catch(error=>{
console.log('Something went wrong')
this.showSpinnerFlag = false
    })
    }

    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record is Created!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

 }