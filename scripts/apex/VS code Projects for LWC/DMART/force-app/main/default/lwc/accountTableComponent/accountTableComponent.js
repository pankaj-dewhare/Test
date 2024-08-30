import { LightningElement } from 'lwc';
import accountRecordShowMethod from '@salesforce/apex/AccountProvider5.accountRecordShowMethod'
export default class AccountTableComponent extends LightningElement {

  accountObject={'sObjectType':'Account'}

  accList;
  totalRecords = 0;
  showAccTableFlag = false

  get slaOptions() {
    return [
        { label: 'Gold', value: 'PGold' },
        { label: 'Silver', value: 'Silver' },
        { label: 'Platinum', value: 'Platinum' },
    ];
}

handleAccSLAChange(event) {
    this.accountObject.SLA__c = event.detail.value;

}

  get typeOptions() {
    return [
        { label: 'Prospect', value: 'Prospect' },
        { label: 'Customer - Direct', value: 'Customer - Direct' },
        { label: 'Customer - Channel', value: 'Customer - Channel' },
        { label: 'Channel Partner / Reseller', value: 'Channel Partner / Reseller' },
        { label: 'Installation Partner', value: 'Installation Partner' },
        { label: 'Technology Partner', value: 'Technology Partner' },
        { label: 'Other', value: 'Other' },
    ];
}

handleAccTypeChange(event) {
    this.accountObject.Type = event.detail.value;
    console.log('Value ='+this.accountObject.Type)

    accountRecordShowMethod({objAcc : this.accountObject})

    .then(result=>{
    console.log('result=',JSON.stringify(result))
    this.accList = result;
    
    this.totalRecords = result.length;
    
    if(result.length > 0){
        this.showAccTableFlag = true
    }else{
        this.showAccTableFlag = false
    }

    })
    
    .catch(error=>{
    console.log('error=',JSON.stringify(error))
    })
}

}