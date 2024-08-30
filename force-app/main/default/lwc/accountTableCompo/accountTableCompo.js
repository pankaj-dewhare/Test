import { LightningElement } from 'lwc';
import accountDataShow from '@salesforce/apex/AccountProvider_5.accountDataShow'
export default class AccountTableCompo extends LightningElement {

accountObject={'sObjectType' : 'Account'}
accList;

handleSearchButton(){
    
    accountDataShow({objAcc : this.accountObject})

    .then(result=>{
console.log('result='+JSON.stringify(result))
this.accList = result;
    })

    .catch(error=>{
console.log('error='+JSON.stringify(error))
    })

}
}