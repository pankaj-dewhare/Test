import { LightningElement } from 'lwc';
import accountRecordInsertMethod from '@salesforce/apex/AccountProvider_5.accountRecordInsertMethod'
export default class AccountForm5 extends LightningElement {

    accountName; 

    submitButtonHandler(){
    
        this.accountName = this.template.querySelector('lightning-input[data-formfield="accName"]').value
        console.log('input field value='+this.accountName)

        accountRecordInsertMethod({acName : this.accountName})

        .then(result=>{
        console.log('record has been created')
        })

        .catch(error=>{
        console.log('Something went wrong')
        })
    }
}