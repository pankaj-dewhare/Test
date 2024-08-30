import { LightningElement } from 'lwc';
import accountRecordCreation from '@salesforce/apex/AccountProvider2.accountRecordCreation'
export default class AccountForm3 extends LightningElement {

    accountObject={'sObjectType': 'Account'}

    handleSubmitButton(){

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formField="accName"]').value

        accountRecordCreation({objAcc : this.accountObject})

        .then(result=>{
            console.log('Result='+result);
        })

        error(error=>{
            console.log('Error='+error);
        })
    }
}