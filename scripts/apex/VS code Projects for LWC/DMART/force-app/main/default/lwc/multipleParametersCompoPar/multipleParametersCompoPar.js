import { LightningElement } from 'lwc';

export default class MultipleParametersCompoPar extends LightningElement {

    x=100
    c;

    showButtonHandler(){
        this.c = 200;

    }
}