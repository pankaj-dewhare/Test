import { LightningElement } from 'lwc';

export default class TwoWayDatabinding extends LightningElement {

    fullName = ''
    title = ''

    onkeyupHandler(event){
this.fullName = event.target.value;
console.log('Value came from full name'+this.fullName)
    }

    onchangeHandler(event){
        this.title = event.target.value;
        console.log('Value came from title'+this.fullName)
    }
}