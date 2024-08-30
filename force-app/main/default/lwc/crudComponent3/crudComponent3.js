import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ; 
import accountRecordInsertion from '@salesforce/apex/CRUDOperationApexClass.accountRecordInsertion'
import searchAccountMethod from '@salesforce/apex/CRUDOperationApexClass.searchAccountMethod'
import updateAccountMethod from '@salesforce/apex/CRUDOperationApexClass.updateAccountMethod'
import deleteAccountMethod from '@salesforce/apex/CRUDOperationApexClass.deleteAccountMethod'
export default class CrudComponent3 extends LightningElement {

accountObject={'sObjectType' : 'Account'}
showInputField = true
showSpinnerFlag = false
saveButtonFlag = true
searchFieldsFlag = false
searchButtonFlag = false
updateNowButtonFlag = false


//Type Combobox Started
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
        console.log('Type value=',this.accountObject.Type )
    }
//Type combobox end

//SLA combobx started
    get SlaOptions() {
        return [
            { label: 'Gold', value: 'Gold' },
            { label: 'Silver', value: 'Silver' },
            { label: 'Platinum', value: 'Platinum' },
            { label: 'Bronze', value: 'Bronze' },
        ];
    }

    handleSLAChange(event) {
        this.accountObject.SLA__c = event.detail.value;
        console.log('SLA value=',this.accountObject.SLA__c )
    }

    //SLA combobox End

    createButtonHandler(){
   console.log('I am create button handler')
    this.showInputField = true
    this.saveButtonFlag = true
    this.searchButtonFlag = false
    this.updateNowButtonFlag = false
    this.searchFieldsFlag = false
   
    }

    readButtonHandler(){
        console.log('I am read button handler')
        this.showInputField = false
        this.searchButtonFlag = true
        this.updateNowButtonFlag = false
        this.saveButtonFlag = false
    }

    updateButtonHandler(){
        console.log('I am update button handler')
        this.showInputField = true
        this.updateNowButtonFlag = true
        this.saveButtonFlag = false
        this.searchButtonFlag = false
        this.searchFieldsFlag = false

    }

    deleteButtonHandler(){
        this.showSpinnerFlag = true

        if(confirm("Are you sure?") == true){
        console.log('I am delete button handler')

        deleteAccountMethod({objAcc : this.accountObject})
        
        .then(result=>{
            console.log('result='+JSON.stringify(result))
            this.showSpinnerFlag = false
            this.showSuccessToastDelete()
        })

        .catch(error=>{
            console.log('error='+JSON.stringify(error))
            this.showSpinnerFlag = false
        })
       }
    }

    showSuccessToastDelete() {
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
        console.log('accValue='+this.accountObject.Name)
        
        accountRecordInsertion({objAcc : this.accountObject})

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
            message: 'Record Created...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }


    searchButtonHandler(){
    this.showSpinnerFlag = true
        

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value

        searchAccountMethod({objAcc : this.accountObject})

        .then(result=>{
            console.log('result='+JSON.stringify(result))
            this.accountObject = result
            this.searchFieldsFlag = true
            this.searchButtonFlag = true
            this.showSpinnerFlag = false
            this.showSuccessToastSearch()
        })

        .catch(error=>{
            console.log('error='+JSON.stringify(error))
        })

    }

    showSuccessToastSearch() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Found...!!!',
            variant: 'info',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }



    updateNowButtonHandler(){
        this.showSpinnerFlag = true
        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value

        updateAccountMethod({objAcc : this.accountObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.showSpinnerFlag = false
        this.showSuccessToastUpdate();
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        this.showSpinnerFlag = false
        })

    }

    showSuccessToastUpdate() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Update...!!!',
            variant: 'warning',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }



}