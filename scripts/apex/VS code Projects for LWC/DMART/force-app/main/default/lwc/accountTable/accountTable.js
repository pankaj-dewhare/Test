import { LightningElement } from 'lwc';
import typeRecordShowMethod from '@salesforce/apex/aFormCreator.typeRecordShowMethod'
export default class AccountTable extends LightningElement {

    accountObject={'sObjectType' : 'Account'}

    totalRecords = 0
    accList;
    showTableFlag = false

    get typeOptions() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Customer - Channel', value: 'Customer - Channel' },
            { label: 'Channel Partner / Reseller', value: 'Channel Partner / Reseller' },
            { label: 'Installation Partner', value: 'Installation Partner' },
            { label: 'Technology Partner', value: 'Technology Partnerl' },
            { label: 'Other', value: 'Other' },
        ];
    }

    handleTypeChange(event) {
        this.accountObject.Type = event.detail.value;
        console.log(this.accountObject.Type)

        typeRecordShowMethod({objAcc : this.accountObject})

        .then(result=>{
    console.log('result='+JSON.stringify(result))
    this.accList = result;
    this.totalRecords = result.length;
    if(result.length > 0){
    this.showTableFlag = true
    }
    else{
    this.showTableFlag = false
    }
        })

        .catch(error=>{
    console.log('error='+JSON.stringify(error))
        })
    }
}