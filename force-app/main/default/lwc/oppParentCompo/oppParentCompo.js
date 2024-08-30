import { LightningElement } from 'lwc';
import opportunityChildRecordFetch from '@salesforce/apex/OpportunityProvider.opportunityChildRecordFetch'
export default class OppParentCompo extends LightningElement {
 
    opportunityObject={'sObjectType' : 'Opportunity'}
    fromDate
    toDate
   /* maxAmount
    minAmount*/
    
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
        this.opportunityObject.StageName = event.detail.value;
        console.log('Stage value='+this.opportunityObject.StageName)

        this.fromDate = this.template.querySelector('lightning-input[data-formfield="fDate"]').value
        console.log( this.fromDate)
        this.toDate = this.template.querySelector('lightning-input[data-formfield="tDate"]').value
        console.log( this.toDate)
       /* this.maxAmount = this.template.querySelector('lightning-input[data-formfield="maxAmount"]').value
        console.log( this.maxAmount)
        this.minAmount = this.template.querySelector('lightning-input[data-formfield="minAmount"]').value
        console.log( this.minAmount)*/

        
        opportunityChildRecordFetch({'fromDte' : this.fromDate, 'toDte' : this.toDate, /* 'maxAmt' : this.maxAmount, 'minAmt' : this.minAmount, objOpp : this.opportunityObject*/});
    
        


        
        
    }
}