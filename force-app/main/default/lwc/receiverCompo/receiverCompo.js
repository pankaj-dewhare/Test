import { LightningElement, wire } from 'lwc';
import MYCHANNEL from "@salesforce/messageChannel/OpptyDataChannel__c";
import {subscribe, MessageContext,APPLICATION_SCOPE} from "lightning/messageService"

export default class ReceiverCompo extends LightningElement {

    @wire(MessageContext)
    context

    opportunityList

    connectedCallback(){
        this.receiveDataHandler();
    }

receiveDataHandler(){
    subscribe(this.context, MYCHANNEL, (message)=>{this.handleMessage(message)}, {scope : APPLICATION_SCOPE} )
}

handleMessage(message){
   this.opportunityList = message.opptyListChannel.value;
}




}