import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
export default class ModelPublisherCompo extends LightningElement {

accountName;

    sendButtonHandler(){
        console.log('I am send button JS method')
        this.accountName = this.template.querySelector('lightning-input[data-formfield="accName"]').value
        console.log(this.accountName)

        pubsub.publish('eventName' , this.accountName);
    }
}