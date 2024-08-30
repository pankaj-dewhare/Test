import { LightningElement, api, wire} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi'; 
import GENDER_FIELD from '@salesforce/schema/Applicant__c.Gender__c'

const fields = [GENDER_FIELD]
export default class GenderCompo extends LightningElement {

    @api recordId
    genderFlag = false

    @wire(getRecord, { recordId: '$recordId', fields })
    applicant;

    get gender() {
    if(getFieldValue(this.applicant.data, GENDER_FIELD) == 'Male'){
        this.genderFlag = true
    }
    else
    {
        this.genderFlag = false
    }
        return getFieldValue(this.applicant.data, GENDER_FIELD);
    }


}