import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import accRecordCreator from '@salesforce/apex/aFormCreator.accRecordCreator'
import searchRecordMethod from '@salesforce/apex/aFormCreator.searchRecordMethod'
import updateRecordMethod from '@salesforce/apex/aFormCreator.updateRecordMethod'
import deleteRecordMethod from '@salesforce/apex/aFormCreator.deleteRecordMethod'
export default class AccForm extends LightningElement {

    accountObject={'sObjectType': 'Account'}

    showInputFieldFlag = true
    showSpinnerFlag = false
    searchFieldFlag = false
    searchNowButtonFlag = false
    updateNowButtonFlag = false
    submittedButtonHandler = true


/*Type combobox start*/
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
        console.log(this.accountObject.Type);
    }
/*Type combobox End*/

/*SLA combobox start*/
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
    console.log(this.accountObject.SLA__c);
}
/*SLA combobox End*/

createButtonHandler(){
console.log('I am creating')
this.showInputFieldFlag = true
this.searchFieldFlag = false
this.submittedButtonHandler = true
this.updateNowButtonFlag = false
this.searchNowButtonFlag = false
}

searchButtonHandler(){
    console.log('I am searching')
    this.showInputFieldFlag = false
    this.searchNowButtonFlag = true
    this.updateNowButtonFlag = false
    this.submittedButtonHandler = false
    
}

updateButtonHandler(){
    console.log('I am upting')
    this.updateNowButtonFlag = true
    this.searchNowButtonFlag = false
    this.searchFieldFlag = false
    this.showInputFieldFlag = true

}

deleteButtonHandler(){
    console.log('I am deleting')
    this.showSpinnerFlag = true
    this.updateNowButtonFlag = false

    if(confirm("Are you sure?") == true){
    deleteRecordMethod({objAcc : this.accountObject})

    .then(result=>{
    console.log('result='+JSON.stringify(result))
    this.showSpinnerFlag = false
    this.showDeleteToast()
    })

    .catch(error=>{
        console.log('result='+JSON.stringify(error))
    })
   }
   else{
    this.showSpinnerFlag = false
   }
}

showDeleteToast() {
    const evt = new ShowToastEvent({
        title: 'Message',
        message: 'Record is Deleted...!!!',
        variant: 'error',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}

    handleSubmittedButton(){
    console.log('I am handle submit button')
    this.showSpinnerFlag = true
        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accountHeJi"]').value
        console.log(this.accountObject.Name)
        accRecordCreator({objAcc : this.accountObject})

        .then(result=>{
        console.log('result='+result)
        this.showSpinnerFlag = false
        this.showSuccessToast()
        })

        .catch(error=>{
        console.log('error='+error)
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

    handleSearchNowButton(){
        console.log('I am searching now')
        this.showSpinnerFlag = true

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accountHeJi"]').value

        searchRecordMethod({objAcc : this.accountObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.searchFieldFlag = true
        this.showSpinnerFlag = false
        this.showInputFieldFlag = false
        this.accountObject = result
        this.searchRecordToast() 
        
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        this.showSpinnerFlag = false
        })

    }

    searchRecordToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Found...!!!',
            variant: 'Information',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

    handleUpdateNowButton(){
        console.log('I am updating now')
        this.showSpinnerFlag = true

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accountHeJi"]').value

        updateRecordMethod({objAcc : this.accountObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.showSpinnerFlag = false
        this.updateRecordToast()
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        this.showSpinnerFlag = false
        })
    }

    updateRecordToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Is Updated...!!!',
            variant: 'Warning',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
}