import { LightningElement } from 'lwc';
import accountRecordInsertion from '@salesforce/apex/CRUDOperationApexClass.accountRecordInsertion'
export default class CRUDCompo4 extends LightningElement {

    accountObject = {'sObjectType':'Account'};

/*Type combo start*/
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
        this.accountObject.type = event.detail.value;
        console.log(this.accountObject.type)
    }
/*Type combo End*/

/*SLA combo Start*/
    get slaOptions() {
        return [
            { label: 'Gold', value: 'Gold' },
            { label: 'Silver', value: 'Silver' },
            { label: 'Platinum', value: 'Platinum' },
            { label: 'Bronze', value: 'Bronze' },
        ];
    }

    handleSlaChange(event) {
        this.accountObject.SLA__c = event.detail.value;
        console.log(this.accountObject.SLA__c)
    }

    /*SLA combo End*/

    createButtonHandler(){

        

    }

    searchButtonHandler(){

    }

    updateButtonHandler(){

    }

    deleteButtonHandler(){
        
    }

    saveButtonHandler(){
        console.log('Save button clicked')

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value
        console.log('Account Name Value='+this.accountObject.Name)

        accountRecordInsertion({objAcc : this.accountObject})

        .then(result=>{
          console.log('result='+result)
        })

        .catch(error=>{
          console.log('error='+error)
        })

    }

    searchNowButtonHandler(){

    }

    updateNowButtonHandler(){

    }
}