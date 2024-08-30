import { LightningElement } from 'lwc';
import applicantDataTabelShowMethod from '@salesforce/apex/ApplicantProvider5.applicantDataTabelShowMethod'
export default class ApplicantDataTableShowByDate extends LightningElement {


    frmDate
    tDate

    appList
    onblurHandler(){
    
        this.frmDate = this.template.querySelector('lightning-input[data-formfield="fromDate"]').value
        this.tDate = this.template.querySelector('lightning-input[data-formfield="toDate"]').value
        console.log('I am onblurfunction')
        console.log('from date='+this.frmDate , 'to Date ='+this.tDate)

        applicantDataTabelShowMethod({fromDateParam : this.frmDate, toDateParam : this.tDate})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.appList = result
        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })
    }
}