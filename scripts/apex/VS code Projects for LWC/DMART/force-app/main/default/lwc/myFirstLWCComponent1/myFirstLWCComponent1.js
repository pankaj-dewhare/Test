import { LightningElement } from 'lwc';

export default class MyFirstLWCComponent1 extends LightningElement {


    name;
    firstName = 'Rahul'
    mobile = 9730237637
    salary = 5000.50
    flag = true
    Date = new Date();

    accountObject = {'sObjectType':'Account'}

    objContact = {
        'FirstName':'Munni',
        'LastName' : 'Badnam',
        'Email':'pankaj.dewhare11@gmail.com'
    }

    empList = ['Bunty', 'Bubli', 'Munni', 'Chunni']

}