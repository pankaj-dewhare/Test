import { LightningElement, track } from 'lwc';

export default class AccountTrackDecoratorCompo extends LightningElement {

 //@track accountobject={'sObjectType' : 'Account'};

 accName

    showButtonHandler(){
   this.accName = this.template.querySelector('lightning-input[data-formfield="accName"]').value
    console.log(this.accName)
    }
}