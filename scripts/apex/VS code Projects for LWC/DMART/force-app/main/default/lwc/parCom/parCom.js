import { LightningElement } from 'lwc';
import getOppRecords from '@salesforce/apex/OpportunityProviderNew.getOppRecords'
export default class ParCom extends LightningElement {

    objOpportunity={'sObjectType' : 'Opportunity'}
    oppList;

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
        this.objOpportunity.StageName = event.detail.value;
        console.log(this.objOpportunity.StageName)

        getOppRecords({objOpp : this.objOpportunity})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.oppList = result
        })

        .catch(error=>{
         console.log('error='+JSON.stringify(error))
        })
    }
}