import { LightningElement } from 'lwc';
import accountTypeTable from '@salesforce/apex/AccountProvider1.accountTypeTable'
export default class AccShowInTable extends LightningElement {

    accountObject={'sObjectType' : 'Account'}
    accList
    showTableFlag = false
    totalRecord = 0;

    get typeOptions() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Customer - Channel', value: 'Customer - Channel' },
            { label: 'Channel Partner / Reseller', value: 'Channel Partner / Reseller' },
            { label: 'Technology Partner', value: 'Technology Partner' },
            { label: 'Other', value: 'Other' },

        ];
    }

    handleTypeChange(event) {
        this.accountObject.Type = event.detail.value;
        console.log(this.accountObject.Type)

        accountTypeTable({objAcc : this.accountObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.accList = result
        this.showTableFlag = true
        this.totalRecord = result.length;
        if(result.length > 0){
            this.showTableFlag = true
        }
        else{
            this.showTableFlag = false
        }

        })

        .catch(error=>{
console.log('Error='+JSON.stringify(error))
        this.showTableFlag = false
        })
    }

    
}