import { LightningElement } from 'lwc';
import accRecordInsertMethod from '@salesforce/apex/AccRecordInsertClass.accRecordInsertMethod'
export default class AccInsertCompo extends LightningElement {


    accountObject = {'sObjectType' : 'Account'}

    get industryOptions() {
        return [
            { label: 'Agriculture', value: 'Agriculture' },
            { label: 'Apparel', value: 'Apparel' },
            { label: 'Banking', value: 'Banking' },
        ];
    }

    handleIndustryChange(event) {
        this.accountObject.value = event.detail.value;

        console.log('value ='+this.accountObject.value)
    }

    handleSaveButton(){
        console.log('I am in JS method')

        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accName"]').value
        console.log('main value='+this.accountObject.Name)

        accRecordInsertMethod({objAcc : this.accountObject})

        .then(result=>{
console.log('result='+JSON.stringify(result))
        })

        .catch(error=>{
console.log('error='+JSON.stringify(error))
        })
    }
}