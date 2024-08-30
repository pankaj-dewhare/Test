import { LightningElement } from 'lwc';
import showNameByFirstLetterMethod from '@salesforce/apex/ApplicantProviderNew.showNameByFirstLetterMethod'
export default class ApplicantComponentShowByWord extends LightningElement {


    appLicantObject={'sObjectType' : 'Applicant__c'}

    appList

    handleOnKeyUp(){

        this.appLicantObject.First_Name__c = this.template.querySelector('lightning-input[data-formfield="appName"]').value
        console.log(this.appLicantObject.First_Name__c)


        showNameByFirstLetterMethod({objOpp: this.appLicantObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.appList = result
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })
        
    }

}