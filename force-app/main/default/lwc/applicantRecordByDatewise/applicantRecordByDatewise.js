import { LightningElement } from 'lwc';

export default class ApplicantRecordByDatewise extends LightningElement {

    fromDate
    toDate
    
    searchApplicantHandler(){

this.fromDate = this.template.querySelector('lightning-input[data-formfield={fromDate}]').value;
this.toDate = this.template.querySelector('lightning-input[data-formfield={toDate}]').value;
console.log('I am blur keyword')
console.log('from date value ='+this.fromDate)
console.log('to date value ='+this.toDate)
    }

}