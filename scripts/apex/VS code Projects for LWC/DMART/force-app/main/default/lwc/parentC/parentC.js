import { LightningElement } from 'lwc';

export default class ParentC extends LightningElement {

    childMessage = 'Waiting..!!!!'

    parentMethod(event){
        this.childMessage = event.detail

    }
}