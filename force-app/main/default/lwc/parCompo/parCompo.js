import { LightningElement } from 'lwc';

export default class ParCompo extends LightningElement {

    x = 100;
    c;
    handleButton(){
    this.c = 200
    }
}