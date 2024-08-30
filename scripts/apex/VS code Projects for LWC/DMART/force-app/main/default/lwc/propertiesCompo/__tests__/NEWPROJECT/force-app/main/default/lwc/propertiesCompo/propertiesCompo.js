import { LightningElement } from 'lwc';

export default class PropertiesCompo extends LightningElement {

    Name;
    firstName = 'Manoj';
    lastName = 'Vaidya';
    salary = 10000.500
    mobileNumber = 9730237637
    male = true;
    currentDate = new Date()
    accObject={'sObjectType' : 'Account'}
    contactObj={

        'FirstName' : 'Rahul',
        'LastName' : 'Vaidya',
        'Phone' : 123456789
    }

    employeeList=['Shubham','Bunty','Sonu','Badshah'];
}