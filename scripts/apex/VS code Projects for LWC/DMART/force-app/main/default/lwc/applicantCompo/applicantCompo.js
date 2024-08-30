import { LightningElement } from 'lwc';

export default class ApplicantCompo extends LightningElement {

    appId;

    handleApplicantBlur(){  
    console.log('I am a JS blur method')
    this.appId = this.template.querySelector('lightning-input[data-formfield="appId"]').value
    console.log(this.appId)
    }
}