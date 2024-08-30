import { LightningElement } from 'lwc';

export default class EnableDisableCompoNew extends LightningElement {

    
    searchButtonShowFlag = false
    editButtonShowFlag = true

    handleSearchButton(){
     this.searchButtonShowFlag = true
     this.editButtonShowFlag = false
    }

    handleEditButton(){
        this.searchButtonShowFlag = false
        this.editButtonShowFlag = true
    }
}