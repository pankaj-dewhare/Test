import { LightningElement } from 'lwc';
import showDataByFirstWord from '@salesforce/apex/ApplicantProvider5.showDataByFirstWord'
export default class ShowDataByFirstWord extends LightningElement {


    firstLetter
    appList

    handlerOnkeyupFunction(){

        this.firstLetter = this.template.querySelector('lightning-input[data-formfield="fName"]').value
        console.log('Value='+this.firstLetter)

        showDataByFirstWord({firstName : this.firstLetter})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.appList = result
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })
    }
}