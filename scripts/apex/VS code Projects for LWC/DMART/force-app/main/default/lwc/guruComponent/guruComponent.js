import { LightningElement, wire } from 'lwc';
import MYCHANNEL from "@salesforce/messageChannel/AccountDataChannel__c";
import {publish, MessageContext} from "lightning/messageService"

export default class GuruComponent extends LightningElement {

    @wire(MessageContext)
    context
    myAccountName;

    sendButtonHandler(){
    this.myAccountName = this.template.querySelector('lightning-input[data-formfield="accName"]').value
    console.log(this.myAccountName)

    const message={
        accNameChannelField :{
            value:this.myAccountName
        }
     }

     publish(this.context, MYCHANNEL, message);

    }
}