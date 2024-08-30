import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';
export default class PublisherComponent extends LightningElement {

    accountName;

    handleSendDataButton(){

        this.accountName = this.template.querySelector('lightning-input[data-formfield="accName"]').value

        pubsub.publish('eventname', this.accountName)
        console.log('Data has been sent')
        
    }
}