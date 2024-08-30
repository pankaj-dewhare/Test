import { LightningElement, wire} from 'lwc';
import applicantGenderPoliceMethod from '@salesforce/apex/applicantProvider.applicantGenderPoliceMethod'
export default class ApplicantGenderComponent extends LightningElement {

    gender = 'Male'
    policeVer = true

    @wire(applicantGenderPoliceMethod, {gender : '$gender', police : '$policeVer'}) applicantList;

}