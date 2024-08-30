import { LightningElement } from 'lwc';
import accountRecordInsert from '@salesforce/apex/AccountProvider.accountRecordInsert'
import fetchingAccountRecord from '@salesforce/apex/AccountProvider.fetchingAccountRecord'
import updateAccountRecord from '@salesforce/apex/AccountProvider.updateAccountRecord'
import deleteAccountRecord from '@salesforce/apex/AccountProvider.deleteAccountRecord'
export default class CRUDComponent extends LightningElement {


accountObject = {'sobjectType' : 'Account'}
showSystemFieldsFlag = true
showSearchNowButtonFlag = false
showAccountDetailsFlag = false;
showUpdateNowButtonFlag = false;


/*Account type start*/
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
    console.log('Type value='+this.accountObject.type)
}

/*Account type End*/

/*Account SLA start*/
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
    console.log('SLA value='+this.accountObject.SLA__c)
}
/*Account SLA End*/


    createButtonHandler(){
console.log('I am create button')
this.showSystemFieldsFlag = true
this.showSearchNowButtonFlag = false
this.showAccountDetailsFlag = false
this.showUpdateNowButtonFlag = false



    }

    searchButtonHandler(){
        console.log('I am search button')
        this.showSystemFieldsFlag = false
        this.showSearchNowButtonFlag = true
        this.showUpdateNowButtonFlag = false
    }

    updateButtonHandler(){
        console.log('I am update button')
        this.showSystemFieldsFlag = true
        this.showUpdateNowButtonFlag = true
        this.showSearchNowButtonFlag = false
        
    }

    deleteButtonHandler(){

        if (confirm("Are you sure!") == true) {
        console.log('I am delete button')

        deleteAccountRecord({objAcc : this.accountObject})

        .then(result=>{
console.log('Result ='+JSON.stringify(result))
        })

        .catch(error=>{
            console.log('error ='+JSON.stringify(error))
        })
      }
    }

   
    createSaveButtonHandler(){
        console.log('I am a save button')

       this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value;

       accountRecordInsert({'objAcc' : this.accountObject})

       .then(result=>{
       console.log('Result ='+JSON.stringify(result))
       })
       .catch(error=>{
       Console.log('Error='+JSON.stringify(error))
       })
    }

    searchNowButtonHandler(){
        console.log('I am search now button')

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value;

        fetchingAccountRecord({objAcc : this.accountObject})

        .then(result=>{
console.log('Result='+JSON.stringify(result))
this.accountObject = result
this.showAccountDetailsFlag = true;
        })

        .catch(error=>{
            console.log('Result='+JSON.stringify(error))
        })
    }

    updateNowButtonHandler(){

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value;

        updateAccountRecord({objAcc : this.accountObject})

        .then(result=>{
console.log('Updated ='+JSON.stringify(result))
        })

        .catch(error=>{
            console.log('error ='+JSON.stringify(error))
        })
    }
}