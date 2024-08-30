import { LightningElement } from 'lwc';
import showNameByFirstLetterMethod from '@salesforce/apex/ApplicantProviderNew.showNameByFirstLetterMethod'
export default class ShowByFirstLetterCompo extends LightningElement {


    firstName
    appList

    handleonkey(){

        this.firstName = this.template.querySelector('lightning-input[data-formfield="appName"]').value
        console.log(this.firstName)

        showNameByFirstLetterMethod({firstNameParam : this.firstName})


        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.appList = result
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })
    }
}