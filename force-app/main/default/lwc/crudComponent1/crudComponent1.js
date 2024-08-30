import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ; 
import accountRecordCreation from '@salesforce/apex/AccountProvider1.accountRecordCreation'
import accountRecordSearch from '@salesforce/apex/AccountProvider1.accountRecordSearch'
import updateAccountMethod from '@salesforce/apex/AccountProvider1.updateAccountMethod'
import deleteAccountRecord from '@salesforce/apex/AccountProvider1.deleteAccountRecord'
export default class CrudComponent1 extends LightningElement {

accountObject={'sObjectType':'Account'}

showInputFieldFlag = true;
showSearchNowButtonFlag = false;
showAccFieldsFlag = false;
showUpdateNowButtonFlag = false;
showSaveButtonFlag = true;


// Type combobox start
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
        console.log('Type value='+this.accountObject.Type)
    }

// Type combobox End

// SLA Combobox Start
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
    console.log('SLA value='+this.accountObject.SLA__c);
}


// SLA Combobox End

    handleCreateButton(){
console.log('I am search')
this.showInputFieldFlag = true;
this.showSearchNowButtonFlag = false;
this.showAccFieldsFlag = false;
this.showSaveButtonFlag = true;
this.showUpdateNowButtonFlag = false;


    }

    handleReadButton(){
        console.log('I am read')
        this.showSearchNowButtonFlag = true
        this.showInputFieldFlag = false;
        this.showUpdateNowButtonFlag = false;
        this.showSaveButtonFlag = false;
    
    }

    handleUpdateButton(){
        console.log('I am update')
        this.showUpdateNowButtonFlag = true;
        this.showSearchNowButtonFlag = false;
        this.showInputFieldFlag = true;
        this.showSaveButtonFlag = false;
        this.showAccFieldsFlag = false;
    }

    handleDeleteButton(){
        console.log('I am delete')

        if (confirm("Are you sure?") == true) {

        deleteAccountRecord({objAcc : this.accountObject})

        .then(result=>{
        console.log('Result ='+JSON.stringify(result))
        this.showDeletedToast()
        }) 

        .catch(error=>{
        console.log('Error ='+JSON.stringify(error))
        })
      }

    }
    showDeletedToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record is deleted...!!!',
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    createSaveButtonHandler(){
        console.log('I am save')

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value
        console.log('Name value='+this.accountObject.Name)

        accountRecordCreation({objAcc : this.accountObject})

        .then(result=>{
            console.log('Result ='+JSON.stringify(result))
            this.showSuccessToast();
        })

        .catch(error=>{
            console.log('Error ='+JSON.stringify(error))
            
        })
    }

    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Created!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    searchNowButtonHandler(){
        console.log('I am search now')

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value

        accountRecordSearch({objAcc : this.accountObject})

        .then(result=>{
         console.log('Result ='+JSON.stringify(result))
         this.accountObject = result
         this.showAccFieldsFlag = true;
         this.showSearchNowButtonFlag = false;
         this.showSuccessToastSearch()
        })
        .catch(error=>{
         console.log('Error ='+JSON.stringify(error))
        
        })
    }

    showSuccessToastSearch() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Found!!!',
            variant: 'info',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    updateNowButtonHandler(){


        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value

        updateAccountMethod({objAcc : this.accountObject})

        .then(result=>{
        console.log('Result ='+JSON.stringify(result))
        this.accountObject = result

        this.showUpdatedToastSearch()
        })

        .catch(error=>{
        console.log('Error='+JSON.stringify(error))
        })
    }

    showUpdatedToastSearch() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record is updated!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

}