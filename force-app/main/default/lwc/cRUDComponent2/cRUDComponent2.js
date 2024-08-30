import { LightningElement } from 'lwc';
import AccountrecordInsertMethod from '@salesforce/apex/cRUDInfoProvider.AccountrecordInsertMethod'
export default class CRUDComponent2 extends LightningElement {

accountObject={'sObjectType' : 'Account'}

/*Account type combo start*/
    get typeOptions() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Customer - Channel', value: 'Customer - Channel' },
            { label: 'Other', value: 'Other' },
        ];
    }

    handleTypeChange(event) {
        this.accountObject.type = event.detail.value;
    }
/*Account type combo End*/

/*Account SLA combo start*/
get slaOptions() {
    return [
        { label: 'Gold', value: 'Gold' },
        { label: 'Silver', value: 'Silver' },
        { label: 'Platinum', value: 'Platinum' },
    ];
}

handleslaChange(event) {
    this.accountObject.SLA__c = event.detail.value;
}
/*Account SLA combo End*/



    createButtonHandler(){

    }

    searchButtonHandler(){

    }

    updateButtonHandler(){

    }

    deleteButtonHandler(){

    }

    createSaveButtonHandler(){
        
        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value;

        AccountrecordInsertMethod({objAcc : this.accountObject})

        .then(result=>{
console.log('result='+JSON.stringify(result))
        })

        .catch(error=>{
console.log('error='+JSON.stringify(error))
        })

    }

    searchNowButtonHandler(){

    }

    updateButtonHandler(){

    }
}