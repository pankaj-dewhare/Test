import { LightningElement } from 'lwc';
import addressRecordMethod from '@salesforce/apex/AddressProvider.addressRecordMethod'
export default class ParentAppComponent extends LightningElement {


    applicantId

    adrList

    onblurFunction(){
        this.applicantId = this.template.querySelector('lightning-input[data-formfield="appId"]').value
        console.log(this.applicantId)

        addressRecordMethod({applId : this.applicantId})

        .then(result=>{
console.log('result='+JSON.stringify(result))
this.adrList = result
        })

        .catch(error=>{
console.log('error='+JSON.stringify(error))
        })
    }
}