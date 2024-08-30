import { LightningElement } from 'lwc';

export default class EnableDisableButtonCompo extends LightningElement {

disabledSearchButtonFlag = false;
disabledEditButtonFlag = true;


    handleSearchButton(){
        this.disabledSearchButtonFlag = true;
        this.disabledEditButtonFlag = false;

    }

    handleEditButton(){
        this.disabledSearchButtonFlag = false;
        this.disabledEditButtonFlag = true;


    }
}