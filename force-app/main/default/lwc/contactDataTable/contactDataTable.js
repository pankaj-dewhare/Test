import { LightningElement } from 'lwc';
import contactRecordShowInDataTable from '@salesforce/apex/ContactProvider1.contactRecordShowInDataTable'
export default class ContactDataTable extends LightningElement {

    contactObject={'sObjectType' : 'Contact'}

    deleteSelectedRecords = 0
    conList

    handleOnKeyUp(){
        this.contactObject.LastName = this.template.querySelector('lightning-input[data-formfield="contName"]').value
        console.log(this.contactObject.LastName)

        contactRecordShowInDataTable({objCon : this.contactObject})

        .then(result=>{
    console.log('result='+JSON.stringify(result))
    this.conList = result
        })

        .catch(error=>{
    console.log('error='+JSON.stringify(error))
        })

    }

    handleDeleteButton(){

    }
}