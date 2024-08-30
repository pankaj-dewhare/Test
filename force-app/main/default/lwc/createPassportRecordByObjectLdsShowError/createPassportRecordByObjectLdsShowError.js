import { LightningElement } from 'lwc';
import PASSPORT_OBJECT from "@salesforce/schema/Passport__c";
import PASSPORT_NUMBER_FIELD from "@salesforce/schema/Passport__c.Passport_No__c";
import STATUS_FIELD from "@salesforce/schema/Passport__c.Status__c";
import APPLICANT_NAME_FIELD from "@salesforce/schema/Passport__c.Applicant__c";

export default class CreatePassportRecordByObjectLdsShowError extends LightningElement {


  passportObject = PASSPORT_OBJECT;
  passNumber = PASSPORT_NUMBER_FIELD;
  passStatus = STATUS_FIELD;
  passApplicant = APPLICANT_NAME_FIELD;

  objPassport={'sObjectType' : 'Passport__c'}

  passApplicantMethod(event){
    this.objPassport.Applicant__c = event.target.value;
  }
  passNumberMethod(event){
    this.objPassport.Passport_No__c = event.target.value;
  }

  passStatusMethod(event){
    this.objPassport.Status__c = event.target.value;
  }

  

  handlePassportCreated(){

  }
}