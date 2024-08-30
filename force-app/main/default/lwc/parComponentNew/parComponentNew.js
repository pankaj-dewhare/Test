import { LightningElement, api } from 'lwc';


export default class ParComponentNew extends LightningElement {

    columns = [
        { label: 'Opp Name', fieldName: 'Name', editable: true },
        { label: 'Stage', fieldName: 'StageName', editable: true },
        { label: 'Created Date', fieldName: 'CreatedDate', editable: true }
      ];

  @api opportunityList;
   //columns = columns

  handleChildData(event){
  this.opportunityList = event.detail
  }
}