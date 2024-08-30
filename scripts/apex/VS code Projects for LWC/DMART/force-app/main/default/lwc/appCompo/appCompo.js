import { LightningElement } from 'lwc';
import addressCreation from '@salesforce/apex/AddressProvider1.addressCreation'
export default class AppCompo extends LightningElement {

appNameId
adrList
tRecords = 0

    handleBlurKey(){
        console.log('I am in JS method')

        this.appNameId = this.template.querySelector('lightning-input[data-formfield="appId"]').value
        console.log(this.appNameId)

        addressCreation({appliId : this.appNameId})

        .then(result=>{
console.log('result='+JSON.stringify(result))
this.tRecords = result.length
this.adrList = result;

        })

        .catch(error=>{
console.log('error='+JSON.stringify(error))
        })
    }
}