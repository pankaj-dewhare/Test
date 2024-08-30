import { LightningElement, track } from 'lwc';

export default class MyFourthLwcComponent extends LightningElement {



@track firstName = 'Ram';
@track lastName = 'Lalla'
@track age = 24;
@track phone = 9730237637;
@track salary = 50000.756;
@track todayDate = new Date()

@track accountObject={'sObjectType' : 'Account'}

@track objContact = {

    'FirstName' : 'Munni',
    'LastName' : 'Chintalwar'
}

@track empList = ['Inky', 'minky', 'chinky',]


}