import { LightningElement } from 'lwc';
import addressCreation from '@salesforce/apex/AddressProviderNew.addressCreation';
export default class ApplicantCompo1 extends LightningElement {

    appNameId
    adrList

    handleBlurButton(){
        this.appNameId = this.template.querySelector('lightning-input[data-formfield="appId"]').value
        console.log(this.appNameIdNameId)

       addressCreation({'applicantId' : this.appNameId})
        .then(result=>{
         console.log('Result='+JSON.stringify(result));
         this.adrList = result
         })
        .catch(error=>{
         console.log('Error='+JSON.stringify(error));
         }) 

    }
}