import { LightningElement } from 'lwc';
import dataFetchingByFirstLetter from '@salesforce/apex/ApplicantProvider1.dataFetchingByFirstLetter'
export default class ApplicantREcordShownByFirstLetter extends LightningElement {

    
firstName
appList

    handleOnKeyUp(){
console.log('i am on handle key up')

this.firstName = this.template.querySelector('lightning-input[data-formfield="appName"]').value
console.log('value in first name input'+this.firstName)

dataFetchingByFirstLetter({fName : this.firstName})

.then(result=>{
console.log('Result='+JSON.stringify(result))
this.appList = result
})

.catch(error=>{
    console.log('Error ='+JSON.stringify(error))
})
    }
    
}