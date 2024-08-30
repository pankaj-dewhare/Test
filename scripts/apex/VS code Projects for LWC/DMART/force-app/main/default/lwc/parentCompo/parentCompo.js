import { LightningElement } from 'lwc';

export default class ParentCompo extends LightningElement {
 
 x=200;
 y;

 sendButtonHandler(){
this.y=500
 }
}