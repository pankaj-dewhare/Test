import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
export default class SubCompo extends LightningElement {

    receivedAccName = 'Waiting for Publisher message..!'

    connectedCallback(){
        this.receivedDataHandler()
    }

    receivedDataHandler(){
        pubsub.subscribe("eventName" , (message) => {
           this.receivedAccName = message
        });
    }

}