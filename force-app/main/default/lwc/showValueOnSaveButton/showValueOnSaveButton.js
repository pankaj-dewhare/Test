import { LightningElement } from 'lwc';

export default class ShowValueOnSaveButton extends LightningElement {

    test = true
    name
    salary;
    age;
    
    handleOnchangeName(event){
    this.name = event.target.value
    }

    handleOnChangeSalary(event){
    this.salary = event.target.value
    }

    handleChangeAge(event){
    this.age = event.target.value
    }

    saveButtonHandler(){
    this.test = false
    }
}