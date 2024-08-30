import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub'
export default class SubModal extends LightningElement {

    opportunityList;

    connectedCallback(){
        this.receivedDataHandler()
    }

    receivedDataHandler(){
        pubsub.subscribe("eventName" , (message) => {
           this.opportunityList = message
        });
    }


}