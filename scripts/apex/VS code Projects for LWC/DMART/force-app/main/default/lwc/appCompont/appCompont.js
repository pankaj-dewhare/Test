import { LightningElement } from 'lwc';
import addressRecordShown from '@salesforce/apex/AddressProvider.addressRecordShown'

export default class AppCompont extends LightningElement {

    appName
    adrList
    
    onblurFunctionHandler(){
    console.log('I am blur')

    this.appName = this.template.querySelector('lightning-input[data-formfield="appId"]').value
    console.log('Value='+this.appName)

    addressRecordShown({applicantId : this.appName})
    .then(result=>{
console.log('result='+JSON.stringify(result))
this.adrList = result
    })
    .catch(error=>{
console.log('error='+JSON.stringify(error))
    })
    }
}