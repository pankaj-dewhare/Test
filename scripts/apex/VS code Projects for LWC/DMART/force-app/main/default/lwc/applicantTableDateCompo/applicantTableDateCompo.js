import { LightningElement } from 'lwc';
import showingRecordInTableMethod from '@salesforce/apex/ApplicantProviderNew.showingRecordInTableMethod'
export default class ApplicantTableDateCompo extends LightningElement {

    fromDate;
    toDate
    dateList;
    totalRecords = 0

    handleOnBlur(){
        this.fromDate = this.template.querySelector('lightning-input[data-formfield="fDate"]').value
        console.log(this.fromDate)

        this.toDate = this.template.querySelector('lightning-input[data-formfield="tDate"]').value
        console.log(this.toDate)

        showingRecordInTableMethod({frmDate:this.fromDate, tooDate:this.toDate})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.dateList = result
        this.totalRecords = result.length;
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })
    }
}