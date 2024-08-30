/*User Story 3] Create a Field “Enter First Name”. When Type “A”, show all the Applicants whose Name is Starting with ‘A’. IN A TABLE
If Enter ‘AB’, then show all the Applicants whose Name is Starting with ‘AB’. IN A TABLE */

import { LightningElement } from 'lwc';
import applicantRecordFetchingMethod from '@salesforce/apex/applicantProvider.applicantRecordFetchingMethod'
export default class AppLicantRecordFetchByTyping extends LightningElement {

    enterFisrstName
    appList

    searchingDataByFirstLetter(){

        this.enterFisrstName = this.template.querySelector('lightning-input[data-formfield="enterFName"]').value
        console.log('I am from Searching Data by first Letter')
        console.log('Type first letter='+this.enterFisrstName)

        applicantRecordFetchingMethod({firstName : this.enterFisrstName})

        .then(result=>{
            console.log('Result ='+JSON.stringify(result))
            this.appList = result
        })
        .catch(error=>{
            console.log('Error ='+JSON.stringify(error))
        })


    }
}