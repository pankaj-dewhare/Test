import { LightningElement } from 'lwc';
import accountTypeRecordInsert from '@salesforce/apex/AccountProvider.accountTypeRecordInsert'
export default class AccountTableType extends LightningElement {
    
accountObject={"sObjectType":"Account"}
accList;
totalRecord = 0

get slaOptions() {
    return [
        { label: 'Gold', value: 'Gold' },
        { label: 'Platinum', value: 'Platinum' },
        { label: 'Silver', value: 'Silver' },
        { label: 'Bronze', value: 'Bronze' },
    ];
}

handleSlaChange(event) {
    this.accountObject.SLA__c = event.detail.value;
    console.log('Type value ='+ this.accountObject.SLA__c)
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

    handleTypeChange(event) {
        this.accountObject.Type = event.detail.value;
        console.log('Type value ='+ this.accountObject.Type)

    accountTypeRecordInsert({objAcc: this.accountObject})

    .then(result=>{
     console.log('result='+JSON.stringify(result))
     this.accList = result;
     this.totalRecord = result.length;
    })
    .catch(error=>{
     console.log('result='+JSON.stringify(error))
    })
    }
}