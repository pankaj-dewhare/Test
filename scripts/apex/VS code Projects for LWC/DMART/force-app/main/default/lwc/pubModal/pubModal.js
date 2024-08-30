import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub'
import getOppRecords from '@salesforce/apex/OpportunityProviderNew.getOppRecords'
export default class PubModal extends LightningElement {

    opportunityObject={'sObjectType' : 'Opportunity'}
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
        this.opportunityObject.StageName = event.detail.value;

        getOppRecords({objOpp : this.opportunityObject})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.oppList = result

        pubsub.publish('eventName', this.oppList)
        })

        .catch(error=>{
         console.log('error='+JSON.stringify(error))
        })

    
        
    }
}