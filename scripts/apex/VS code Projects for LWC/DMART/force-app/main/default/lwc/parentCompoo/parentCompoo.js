import { LightningElement } from 'lwc';

export default class ParentCompoo extends LightningElement {

    x=100;
    a;

    handleSendDataButton(){
        this.a = 200;
    }
}