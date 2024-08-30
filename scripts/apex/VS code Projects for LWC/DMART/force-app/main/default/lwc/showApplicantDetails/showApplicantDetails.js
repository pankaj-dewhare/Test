import { LightningElement, wire } from 'lwc';
import applicatRecordShow from '@salesforce/apex/showApplicantDetails.applicatRecordShow'
export default class ShowApplicantDetails extends LightningElement {

    @wire(applicatRecordShow) applicantRecords;
   
}