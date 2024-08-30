import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
export default class SubscriberComponent extends LightningElement {

    accountNameInput = 'waiting'

    connectedCallback(){
        this.receivedDataHandler()
    }

    receivedDataHandler(){
        pubsub.subscribe("eventName" , (message) => {
           this.accountNameInput = message
        });
    }

}