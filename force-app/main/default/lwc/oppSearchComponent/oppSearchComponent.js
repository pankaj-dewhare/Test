import { LightningElement, wire } from 'lwc';
import MYOPPCHANNEL from "@salesforce/messageChannel/OpportunityDataChannel__c";
import {publish, MessageContext} from "lightning/messageService"
import getOppRecords from '@salesforce/apex/OpportunityProviderNew.getOppRecords'


export default class OppSearchComponent extends LightningElement {

    @wire(MessageContext)
    context

    opportunityObject={'sObjectType' : 'Opportunity'}
    oppList

    get stageOptions() {
        return [
            { label: 'Prospecting', value: 'Prospecting' },
            { label: 'Qualification', value: 'Qualification' },
            { label: 'Closed Won', value: 'Closed Won' },
        ];
    }

    handleStageChange(event) {
        this.opportunityObject.StageName = event.detail.value;

        getOppRecords({objOpp : this.opportunityObject})

        .then(result=>{
console.log('result='+JSON.stringify(result))
this.oppList = result

const message={
    opportunityListChannel:{
        value:this.oppList
    }
 }

 publish(this.context, MYOPPCHANNEL, message);


        })

        .catch(error=>{
console.log('error='+JSON.stringify(error))
        })
    }


}