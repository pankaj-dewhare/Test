import { LightningElement } from 'lwc';

export default class MyParentComponent extends LightningElement {

    showPopUpFlag = false

    showPopUpHandler(){
        console.log('I am in Parent JS methos')
        this.showPopUpFlag = true
    }

    popUpMethod(event){
        this.showPopUpFlag = event.detail
    }
}