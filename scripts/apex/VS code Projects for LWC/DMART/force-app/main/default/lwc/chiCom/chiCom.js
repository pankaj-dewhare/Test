import { LightningElement, api } from 'lwc';

export default class ChiCom extends LightningElement {

    @api opportunityList;

    columns = [
        { label: 'Opportunity Name', fieldName: 'Name', editable: true },
        { label: 'Stage', fieldName: 'StageName', editable: true },
        { label: 'Created Date', fieldName: 'CreatedDate', editable: true }
      ];
}