import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
export default class CarSubscriberCompo extends LightningElement {

    receivedData = 'Waiting';

    connectedCallback(){
        this.receivedDataHandler()
    }

    receivedDataHandler(){
        pubsub.subscribe("eventName" , (message) => {
           this.receivedData = message
        });
    }


}