import { LightningElement } from 'lwc';
import applicantIdShowMethod from '@salesforce/apex/ApplicantProviderNew.applicantIdShowMethod'
export default class ApplicantComponentPar extends LightningElement {

    
    appId
    adrList

    handleOnblurFunction(){
    console.log('I am onBlur Function')

    this.appId = this.template.querySelector('lightning-input[data-formfield="appName"]').value
    console.log(this.appId)
       
    applicantIdShowMethod({applicantId : this.appId})
 
    .then(result=>{
    console.log('result='+JSON.stringify(result))
    this.adrList = result
    })

    .catch(error=>{
    console.log('error='+JSON.stringify(error))
    })
    }
}   