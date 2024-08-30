//1) fetch 10 First Name of the record check the solution on ganesh padole notes cause second solution is doing on same component
// 2)Fetch Applicant List Having provided Gender and it police verificaton is true.
import { LightningElement, api, wire} from 'lwc';
import getApplicantRecords from '@salesforce/apex/applicantProvider.getApplicantRecords'
  
export default class ApplicantTenRecords extends LightningElement {
    
    @api recordId
    Gender = 'Male'
    police = true;
    
    @wire(getApplicantRecords, { Gender :'$Gender', police : '$police'}) applicantList;

}