import { LightningElement } from 'lwc';
import dateRangeMethod from '@salesforce/apex/ApplicantProvider1.dateRangeMethod'
export default class ApplicantTableDateRangeComponent extends LightningElement {

fromD
toD
appList
appTableShowFlag = false

totalReord = 0;

    handleBlurMethod(){
        console.log('I am blur function')

        this.fromD = this.template.querySelector('lightning-input[data-formfield="fromDate"]').value
        console.log(this.fromD)
        this.toD = this.template.querySelector('lightning-input[data-formfield="toDate"]').value
        console.log(this.toD)

        dateRangeMethod({fromDateParam : this.fromD, toDateParam : this.toD})

        .then(result=>{
        console.log('Result ='+JSON.stringify(result))
        this.appList = result
        this.appTableShowFlag = true
        this.totalReord = result.length;
        })
        .catch(error=>{
            console.log('Error ='+JSON.stringify(error))
        })
    }
}