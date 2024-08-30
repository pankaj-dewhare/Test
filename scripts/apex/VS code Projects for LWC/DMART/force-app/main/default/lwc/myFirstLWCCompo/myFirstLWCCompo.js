import { LightningElement } from 'lwc';

export default class MyFirstLWCCompo extends LightningElement {

    name; // undefined
    firstName = 'Ram' // string
    lastName = 'Lakhan' // string
    phone = 9730237637 // Number
    salary = 40000.70 // Decimal
    flag = true // Boolean
    todayDate = new Date() // Current date

    objAcc = {'sObjectType':'Account'} // Account Object creation

    applicantObject = {'sObjectType': 'Applicant__c'} // Applicant object creation
    
    objContact = { // Another way of object creation with values
        'FirstName':'Munna',
        'LastName':'Dubey',
        'Email':'munna@gmail.com'
    }

    objApplicant = { // Another way of object creation with values
        'Country__c':'India',
        'State__c':'Maharashtra',
        'City__c':'Nagpur'
    }

    empList = ['Prajwal', 'Sachin', 'Roshan', 'Ishan'] // Array List

    display(){ // Method

    }

    myMethod(){ //Method

    }
}