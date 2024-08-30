//User Story 2] Print “In Progress” if Current Applicant Gender is “Male”. “Closed” for Gender Otherwise.
import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import GENDER_FIELD from '@salesforce/schema/Applicant__c.Gender__c';

const fields = [GENDER_FIELD];

export default class ApplicantCompoGender extends LightningElement {

    @api recordId
    @wire(getRecord, { recordId: '$recordId', fields })
    applicant;
    genderFlag = false

    get gender() {

        if(getFieldValue(this.applicant.data, GENDER_FIELD) == 'Male'){
            this.genderFlag = true
        }
        else{
            this.genderFlag = false
        }

        return getFieldValue(this.applicant.data, GENDER_FIELD);
    }

}