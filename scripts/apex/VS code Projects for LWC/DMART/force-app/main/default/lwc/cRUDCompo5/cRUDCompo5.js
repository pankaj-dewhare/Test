import { LightningElement } from 'lwc';

export default class CRUDCompo5 extends LightningElement {

    accountObjects = {"sObjectType":"Account"}

    createButtonHandler(){
        console.log('I am creating')
    }

    searchButtonHandler(){
        console.log('I am searching');
    }

    updateButtonHandler(){
        console.log('I am updating');
    }

    deleteButtonHandler(){
        console.log('I am deleting');
    }

    
}