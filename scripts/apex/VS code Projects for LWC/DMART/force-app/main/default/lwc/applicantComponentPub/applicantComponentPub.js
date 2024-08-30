import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
import passportRecordMethod from '@salesforce/apex/PassportProvider.passportRecordMethod'
export default class ApplicantComponentPub extends LightningElement {

    appLicantId;

    passportList;
    searchButtonHandler(){
        console.log('I am search button handler')
        this.appLicantId = this.template.querySelector('lightning-input[data-formfield="appId"]').value
        console.log(this.appLicantId)

        pubsub.publish('eventName' , this.passportList);
        passportRecordMethod({ApliID : this.appLicantId})
        

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.passportList = result;
        })

        .catch(error=>{
console.log('error='+JSON.stringify(error))
        })
    }

    
}