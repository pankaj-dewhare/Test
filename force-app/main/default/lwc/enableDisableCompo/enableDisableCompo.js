import { LightningElement } from 'lwc';

export default class EnableDisableCompo extends LightningElement {


    searchButtonFlag = false
    editButtonFlag = true

    
    handleSearchButton(){
       this.searchButtonFlag = true
        this.editButtonFlag = false
    
    }

    handleEditButton(){
        this.searchButtonFlag = false
        this.editButtonFlag = true
    }
}