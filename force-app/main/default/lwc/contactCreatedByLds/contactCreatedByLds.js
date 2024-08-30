import { LightningElement } from 'lwc';
import CONTACT_OBJECT from "@salesforce/schema/Contact";
import FIRSTNAME_FIELD from "@salesforce/schema/Contact.FirstName";
import LASTNAME_FIELD from "@salesforce/schema/Contact.LastName";
import ACCOUNTNAME_FIELD from "@salesforce/schema/Contact.AccountId";

export default class ContactCreatedByLds extends LightningElement {


    contactObject = CONTACT_OBJECT;
    myFields = [FIRSTNAME_FIELD, LASTNAME_FIELD, ACCOUNTNAME_FIELD];

    handleContactCreated(){
        
    }

}