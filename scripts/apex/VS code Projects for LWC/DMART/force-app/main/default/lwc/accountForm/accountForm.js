import { LightningElement } from 'lwc';
import accountRecordInsert from '@salesforce/apex/AccountProvider.accountRecordInsert';
export default class AccountForm extends LightningElement {

accName

    handleSubmitButton(){
        console.log('I am in JS method')

        this.accName = this.template.querySelector('lightning-input[data-formfield="accountName"]').value
        console.log('The value is ='+this.accName)


        accountRecordInsert ({accountName : this.accName})

        .then(result=>{
console.log('result='+result)
        })

        .catch(error=>{
console.log('error='+error)
        })

    }
}