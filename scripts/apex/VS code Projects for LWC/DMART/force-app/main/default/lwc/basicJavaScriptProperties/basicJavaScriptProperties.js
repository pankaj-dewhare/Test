import { LightningElement } from 'lwc';

export default class BasicJavaScriptProperties extends LightningElement {

    name;
    firstName = 'Ram'
    lastName = 'Lakhan'
    mobile = 9730237637
    todaydate = new Date()
    salary = 10000.500
    developer = true

    accountObj = {'sObjectType' : 'Account'}

    contactObj = {'FirstName' : 'Munni',
                  'LastName' : 'Modi'
    }
    

}