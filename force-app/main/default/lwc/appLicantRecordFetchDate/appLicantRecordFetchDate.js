import { LightningElement } from 'lwc';
import applicantDateRecord from '@salesforce/apex/applicantProvider.applicantDateRecord'
export default class AppLicantRecordFetchDate extends LightningElement {

    fromDate
    toDate
    appList


    searchApplicantHandlerNew(){
console.log('I am on blur')

this.fromDate = this.template.querySelector('lightning-input[data-formfield="fromDate"]').value
this.toDate = this.template.querySelector('lightning-input[data-formfield="toDate"]').value

console.log('From date value='+this.fromDate + 'To date values'+this.toDate)

          applicantDateRecord({fromDateParam : this.fromDate, toDateParam : this.toDate})
    .then(result=>{
     console.log('Result ='+JSON.stringify(result));
     this.appList = result;
    })
    .catch(error=>{
     console.log('Error ='+JSON.stringify(error))
    })
    }
}