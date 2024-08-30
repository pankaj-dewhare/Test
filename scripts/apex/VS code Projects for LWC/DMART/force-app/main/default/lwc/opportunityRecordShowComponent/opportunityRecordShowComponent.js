import { LightningElement } from 'lwc';
import opportunityRecordShowInTebleMethod from '@salesforce/apex/OpportunityProvider.opportunityRecordShowInTebleMethod'
export default class OpportunityRecordShowComponent extends LightningElement {

    
    fromDate
    toDate
    minAmount
    maxAmount
    stages
    oppList

    get stageOptions() {
        return [
            { label: 'Prospecting', value: 'Prospecting' },
            { label: 'Qualification', value: 'Qualification' },
            { label: 'Needs Analysis', value: 'Needs Analysis' },
            { label: 'Value Proposition', value: 'Value Proposition' },
            { label: 'Id. Decision Makers', value: 'Id. Decision Makers' },
            { label: 'Perception Analysis', value: 'Perception Analysis' },
            { label: 'Proposal/Price Quote', value: 'Proposal/Price Quote' },
            { label: 'Negotiation/Review', value: 'Negotiation/Review' },
            { label: 'Closed Won', value: 'Closed Won' },
            { label: 'Closed Lost', value: 'Closed Lost' },
        ];
    }

    handleStageChange(event) {
        this.stages = event.detail.value;

    this.fromDate = this.template.querySelector('lightning-input[data-formfield="fDate"]').value
    console.log('from date ='+this.fromDate)
    this.toDate = this.template.querySelector('lightning-input[data-formfield="tDate"]').value
    console.log('to date ='+this.toDate)
    this.minAmount = this.template.querySelector('lightning-input[data-formfield="minAmt"]').value
    console.log('min amount ='+this.minAmount)
    this.maxAmount = this.template.querySelector('lightning-input[data-formfield="maxAmt"]').value
    console.log('max amount ='+this.maxAmount)

    opportunityRecordShowInTebleMethod({frmDate:this.fromDate, tooDate:this.toDate, minimumAmt:this.minAmount, maximumAmt:this.maxAmount, Stage:this.stages})

    .then(result=>{
    console.log('result='+JSON.stringify(result))
    this.oppList = result
    
    })

    .catch(error=>{
    console.log('error='+JSON.stringify(error))
    })
    }
}