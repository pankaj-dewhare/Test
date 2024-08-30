import { LightningElement, wire } from 'lwc';
import MYCHANNEL from "@salesforce/messageChannel/OpptyDataChannel__c";
import {publish, MessageContext} from "lightning/messageService"
import getOppRecords from '@salesforce/apex/OpportunityProviderNew.getOppRecords'

export default class SendCompo extends LightningElement {

    @wire(MessageContext)
    context

    opportunityObject={'sObjectType' : 'Opportunity'}
    oppList

    get StageOptions() {
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
    
         const message={
            opptyListChannel:{
                value:this.oppList
            }
         }
    
         publish(this.context, MYCHANNEL, message);
        })

        .catch(error=>{
         console.log('error='+JSON.stringify(error))
        })
        
    }

    
}