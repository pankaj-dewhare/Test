import { LightningElement } from 'lwc';

export default class EnableDisableButtonComponent extends LightningElement {


    searchButtonFlag = false;
    editButtonFlag = true;

    searchButtonHandler(){
        this.searchButtonFlag = true;
        this.editButtonFlag = false;
    }

    editButtonHandler(){
        this.searchButtonFlag = false;
        this.editButtonFlag = true;
    }
}