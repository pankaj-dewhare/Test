import { LightningElement } from 'lwc';
import accountCreationMethod from '@salesforce/apex/AccountProvider6.accountCreationMethod'
export default class AccountForm6 extends LightningElement {

    accountName

    submitButtonHandler(){

        this.accountName = this.template.querySelector('lightning-input[data-formfield="accName"]').value
        console.log('value='+this.accountName)

        accountCreationMethod({'acName':this.accountName})

        .then(result=>{
console.log('Record has been created')
        })

        .catch(error=>{  
console.log('Something went wrong')
        })

    }
}