import { LightningElement } from 'lwc';

export default class ParentComponent1 extends LightningElement {

    childMessage = 'Waiting for child message'

    parentDisplayMethod(event){
            this.childMessage = event.detail
            }
            
    }