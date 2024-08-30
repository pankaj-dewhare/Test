import { LightningElement } from 'lwc';

export default class ParComponent extends LightningElement {


    childMessage = 'Waiting for child message';

    parentDisplayMethod(event){
        
        this.childMessage = event.detail
            
            
    }
}