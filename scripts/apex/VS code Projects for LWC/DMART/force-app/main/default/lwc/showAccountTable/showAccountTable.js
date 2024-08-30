import { LightningElement } from 'lwc';
import latestRecord from '@salesforce/apex/AccountProvider1.latestRecord'
export default class ShowAccountTable extends LightningElement {

accountObject={'sObjectType' : 'Account'}
accList
    
handleSearchButton(){

    if (confirm("Do you want to see the records?") == true) {

        latestRecord({objAcc : this.accountObject})
        .then(result=>{
console.log('Result='+JSON.stringify(result))
this.accList = result
this.showDeletedToast();
        })
        .catch(error=>{
console.log('error='+JSON.stringify(error))
        })
    }
}

showDeletedToast() {
    const evt = new ShowToastEvent({
        title: 'Message',
        message: 'This is the latest 10 records!!!',
        variant: 'error',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}
}