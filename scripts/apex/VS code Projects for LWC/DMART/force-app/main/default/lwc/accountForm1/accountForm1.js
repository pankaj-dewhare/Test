import { LightningElement } from 'lwc';
import accountCreation from '@salesforce/apex/AccountProvider1.accountCreation'
export default class AccountForm1 extends LightningElement {

    accName

    handleSubmitButton(){
console.log('I am in JS method');

this.accName = this.template.querySelector('lightning-input[data-formfield="accountName"]').value;
console.log('Input value='+this.accName);

accountCreation({accountName : this.accName})

.then(result=>{
console.log('record has been created')
})
.catch(error=>{
console.log('Something went wrong')
})

    }
}