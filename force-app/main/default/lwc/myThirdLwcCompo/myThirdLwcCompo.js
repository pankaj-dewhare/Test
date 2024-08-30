import { LightningElement } from 'lwc';

export default class MyThirdLwcCompo extends LightningElement {

    Name;
    firstName = 'Ram';
    age = 24;
    salary = 10000.500;
    flag = true;
    currentDate = new Date();
    accountObject = {'sObjectType' : 'Account'}

    objContact={
        'FirstName' : 'Rahul',
        'LastName' : 'Borghare',
        'Email' : 'pankaj.dewhare11@gmail.com'
    }

    empList = ['Bunty', 'Bubli', 'Sheela', 'Munni' ];

    display(){

    }

    myMethod(){

    }

}