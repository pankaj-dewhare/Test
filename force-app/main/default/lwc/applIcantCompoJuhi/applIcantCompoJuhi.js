import { LightningElement, api, wire } from 'lwc';
import juhiRecordMethod from '@salesforce/apex/applicantProvider.juhiRecordMethod'
export default class ApplIcantCompoJuhi extends LightningElement {

   applicantObject={'sObjectType' : 'Account'}

    @wire(juhiRecordMethod, {objApp : '$applicantObject'}) applicantList;

    
}