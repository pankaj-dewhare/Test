import { LightningElement } from 'lwc';
import APPLICANT_OBJECT from "@salesforce/schema/Applicant__c";
import FIRSTNAME_FIELD from "@salesforce/schema/Applicant__c.First_Name__c";
import LASTNAME_FIELD from "@salesforce/schema/Applicant__c.Last_Name__c";


export default class ContactCreatedByLds extends LightningElement {


    applicantObject = APPLICANT_OBJECT;
    myFields = [FIRSTNAME_FIELD, LASTNAME_FIELD];

    handleApplicantCreated(){
        
    }

}