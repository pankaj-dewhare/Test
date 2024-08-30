import { LightningElement, wire } from 'lwc';
import MYOPPCHANNEL from "@salesforce/messageChannel/OpportunityDataChannel__c";
import {subscribe, MessageContext,APPLICATION_SCOPE} from "lightning/messageService"

const columns = [
    { label: 'Name', fieldName: 'Name', editable: true },
    { label: 'Stage Name', fieldName: 'StageName', editable: true },
    { label: 'Created Date', fieldName: 'CreatedDate', editable: true }
  ];

export default class OppRecordTable extends LightningElement {

    @wire(MessageContext)
    context
    receivedOppList = 'waiting'
    columns = columns
    oppShowTableFlag = false;

    connectedCallback(){
        this.receiveDataHandler()
}

receiveDataHandler(){
    subscribe(this.context, MYOPPCHANNEL, (message)=>{this.handleMessage(message)}, {scope : APPLICATION_SCOPE} )
}

handleMessage(message){
   this.receivedOppList = message.opportunityListChannel.value

   if(this.receivedOppList.length >0 ){
    this.oppShowTableFlag = true
   }
   else{
    this.oppShowTableFlag = false
   }

   console.log('Jhatka='+this.receivedOppList)
}

    
}