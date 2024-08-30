import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import accountRecordShownByType from '@salesforce/apex/AccountProvider.accountRecordShownByType'
export default class AccountTableShownType extends LightningElement {

    accountObject={'sObjectType' : 'Account'}
    totalRecords = 0
    accList
    showSpinnerFlag = false
    showTableFlag = false
    
   
    get typeOptions() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Customer - Channel', value: 'Customer - Channel' },
            { label: 'Installation Partner', value: 'Installation Partner' },
            { label: 'Channel Partner / Reseller', value: '	Channel Partner / Reseller' },
            { label: 'Technology Partner', value: 'Technology Partner' },
            { label: 'Other', value: 'Other' },
        ];
    }

    handleTypeChange(event) {
        this.accountObject.Type = event.detail.value;
        this.showSpinnerFlag = true
        console.log(this.accountObject.Type)
        
        accountRecordShownByType({objAcc : this.accountObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.accList = result
        this.showSpinnerFlag = false
        this.totalRecords = result.length;
        this.showSuccessToast()
        this.showTableFlag = true
        
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        this.showSpinnerFlag = false
        })
    }

    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Hi Team '+''+this.accountObject.Type+' '+'Record Found must check in the table',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
}