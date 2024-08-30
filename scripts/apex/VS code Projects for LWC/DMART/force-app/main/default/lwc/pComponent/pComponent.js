import { LightningElement } from 'lwc';

export default class PComponent extends LightningElement {

    x = 200
    a
    sendDataButtonHandler(){
      this.a = 100
    }
}