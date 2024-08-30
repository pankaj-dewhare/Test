import { LightningElement } from 'lwc';
import accRecordCreation from '@salesforce/apex/AccountSpecial.accRecordCreation'
export default class Aform extends LightningElement {

    accObject={'sObjectType' : 'Account'}

    subButtonHandler(){
        console.log('I am Submit button')
        this.accObject.Name = this.template.querySelector('lightning-input[data-formfield="acName"]').value
        console.log('Account Name ='+this.accObject.Name)

        accRecordCreation({objAcc : this.accObject})

        .then(result=>{
         console.log('result='+result)
        })

        .catch(error=>{
        console.log('error=>'+error)
        })

    }
   

}