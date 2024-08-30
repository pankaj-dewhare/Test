import { LightningElement } from 'lwc';
import PASSPORT_OBJECT from "@salesforce/schema/Passport__c";
import PASSPORT_NUMBER_FIELD from "@salesforce/schema/Passport__c.Passport_No__c";
import STATUS_FIELD from "@salesforce/schema/Passport__c.Status__c";
import APPLICANT_NAME_FIELD from "@salesforce/schema/Passport__c.Applicant__c";

export default class PassportRecordCreationByLDS extends LightningElement {

    passportObject = PASSPORT_OBJECT
    myFields = [PASSPORT_NUMBER_FIELD , STATUS_FIELD, APPLICANT_NAME_FIELD];
    
    handlePassportCreated(){

    }
}