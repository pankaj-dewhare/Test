import { LightningElement } from 'lwc';

export default class ParentCompoonent extends LightningElement {

    x=100;
    a;

    sendDataButtonHandler(){
        this.a = 200;
    }
}