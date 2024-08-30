import { LightningElement, track } from 'lwc';

export default class Introduction_component_01 extends LightningElement {

    @track Intro_Msg = 'Click the down button';
    @track webSite = 'www.google.com';

    @track showInputFlag
    

    handleJoinNowButton(event){
   console.log('I am in join now button handler');
   console.log('event', event);
   this.showInputFlag = true;
    }

    handleSaveButton(event){
        console.log('I am in save button handler');
        console.log('event', event);
    }

    handleCancelButton(){
        this.showInputFlag = false;
    }
}