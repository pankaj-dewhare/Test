import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
export default class PubCompo extends LightningElement {

    accountName

    sendButtonHandler(){
    this.accountName = this.template.querySelector('lightning-input[data-formfield="accName"]').value
    console.log(this.accountName)

    pubsub.publish('eventName' , this.accountName); // sender sent the date to subscriber (Receiver)
    console.log('Data has been sent ='+this.accountName)
    }
}