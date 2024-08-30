import { LightningElement } from 'lwc';

export default class ShowPopUpCompo extends LightningElement {


    showPopupFlag = false

    popupButtonHandler(){
        this.showPopupFlag = true;

    }

    showFlagMethod(event){
        this.showPopupFlag = event.detail;
    }
}