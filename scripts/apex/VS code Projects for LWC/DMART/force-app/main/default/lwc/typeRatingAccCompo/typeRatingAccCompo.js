import { LightningElement, wire } from 'lwc';
import typeAndRatingMethod from '@salesforce/apex/AccountProvider1.typeAndRatingMethod'
export default class TypeRatingAccCompo extends LightningElement {

    accountObject={'sObjectType' : 'Account'}

    @wire(typeAndRatingMethod, {objAcc : '$accountObject'}) accList
}