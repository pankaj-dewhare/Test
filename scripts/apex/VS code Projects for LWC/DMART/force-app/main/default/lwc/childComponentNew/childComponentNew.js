import { LightningElement } from 'lwc';
import getOppRecords from '@salesforce/apex/OpportunityProviderNew.getOppRecords'
export default class ChildComponentNew extends LightningElement {


    objectOpportunity={'sObjectType' : 'Opportunity'}
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
        this.objectOpportunity.StageName = event.detail.value;
        console.log(this.objectOpportunity.StageName)

        getOppRecords({objOpp : this.objectOpportunity})

        .then(result=>{
        console.log('result='+JSON.stringify(result))
        this.oppList = result

        const myEvent = new CustomEvent("eventname",{
            detail: this.oppList
        });

        this.dispatchEvent(myEvent);

        })

        .catch(error=>{
        console.log('error='+JSON.stringify(error))
        })

        
    }


}