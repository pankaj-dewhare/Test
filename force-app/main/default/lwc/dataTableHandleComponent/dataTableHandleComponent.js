import { LightningElement } from 'lwc';
import dataShownByFirstLetterMethod from '@salesforce/apex/ApplicantProvider5.dataShownByFirstLetterMethod'
export default class DataTableHandleComponent extends LightningElement {

    applicantObject={'sObjectType' : 'Applicant__c'}
    SelectedRecords = 0;
    appList

    searchRecordsForDelete(){

        this.applicantObject.First_Name__c = this.template.querySelectro('lightning-input[data-formfield="appName"]').value;
        console.log(this.applicantObject.First_Name__c);

        dataShownByFirstLetterMethod({objApp : this.applicantObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.appList = result
        })
        
        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })

    }

    handleDeleteButton(){

    }

}