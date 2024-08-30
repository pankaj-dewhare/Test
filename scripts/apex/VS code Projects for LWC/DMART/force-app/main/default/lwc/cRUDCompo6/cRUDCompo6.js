import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import accountRecordCreation from '@salesforce/apex/CRUDAccountProvider.accountRecordCreation'
import accountRecordSearch from '@salesforce/apex/CRUDAccountProvider.accountRecordSearch'
import accountRecordUpdate from '@salesforce/apex/CRUDAccountProvider.accountRecordUpdate'
import accountRecordDelete from '@salesforce/apex/CRUDAccountProvider.accountRecordDelete'
export default class CRUDCompo6 extends LightningElement {

    accountObject={'sObjectType':'Account'}
    showSpinnerFlag = false
    showSearchNowButtonFlag = false
    showUpdateNowButtonFlag = false
    showSaveButtonFlag = false
    showInputFieldFlag = true
    showFourFieldsFlag = false
    

    /*Account Type combo start*/
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
        console.log(this.accountObject.type)
    }

    /*Account Type combo end*/

    /*Account SLA combo start*/
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

    /*Account SLA combo end*/

    createButtonHandler(){
        console.log('I am create')
        this.showSaveButtonFlag = true
        this.showUpdateNowButtonFlag = false
        this.showSearchNowButtonFlag = false
    }

    readButtonHandler(){
        console.log('I am read')
        this.showSaveButtonFlag = false
        this.showSearchNowButtonFlag = true
        this.showUpdateNowButtonFlag = false
        this.showInputFieldFlag = false
    }

    updateButtonHandler(){
        console.log('I am update')
        this.showSaveButtonFlag = false
        this.showSearchNowButtonFlag = false
        this.showUpdateNowButtonFlag = true
        this.showFourFieldsFlag = false
        this.showInputFieldFlag = true
    }

    deleteButtonHandler(){
        console.log('I am delete')
        this.showSpinnerFlag = true
        this.showSaveButtonFlag = false
        this.showSearchNowButtonFlag = false
        this.showUpdateNowButtonFlag = false

        if(confirm('Are you sure?') == true){
        accountRecordDelete({objAcc:this.accountObject})

        .then(result=>{
         console.log('result='+result)
         this.showSpinnerFlag = false
         this.showErrorToast()
        })

        .catch(error=>{
        console.log('error='+error)
        this.showSpinnerFlag = false
        })
    }
}
 
showErrorToast() {
    const evt = new ShowToastEvent({
        title: 'Message',
        message: 'Record is deleted...!!!',
        variant: 'error',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}

    saveButtonHandler(){
        this.showSpinnerFlag = true

      this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value
      console.log(this.accountObject.Name)

      accountRecordCreation({objAcc : this.accountObject})

      .then(result=>{
     console.log('result='+JSON.stringify(result))
     this.showSpinnerFlag = false
     this.showSuccessToast()
      })

      .catch(error=>{
     console.log('error='+JSON.stringify(error))
     this.showSpinnerFlag = false
      })
    }

    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record is created...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    searchNowButtonHandler(){
        console.log('I am search Now')
        this.showSpinnerFlag = true
        this.showFourFieldsFlag = true

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value

        accountRecordSearch({objAcc:this.accountObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.accountObject = result
        this.showSpinnerFlag = false
        this.showInformationToast()
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        this.showSpinnerFlag = false
        })
        
    }

    showInformationToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record is Found...!!!',
            variant: 'information',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    updateNowButtonHandler(){
        console.log('I am update Now')
        this.showSpinnerFlag = true

        accountRecordUpdate({objAcc : this.accountObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.accountObject = result
        this.showSpinnerFlag = false
        this.showWarningToast()
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        this.showSpinnerFlag = false
        })
    }

    showWarningToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record is Updated...!!!',
            variant: 'warning',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }



}