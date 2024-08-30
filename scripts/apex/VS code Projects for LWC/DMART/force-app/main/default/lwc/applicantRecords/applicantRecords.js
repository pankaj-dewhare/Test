import { LightningElement, wire } from 'lwc';
import applicantRecords from '@salesforce/apex/applicantProvider.applicantRecords'
export default class ApplicantRecords extends LightningElement {

    @wire(applicantRecords) applicantList;
    



}