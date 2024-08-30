import { LightningElement, api} from 'lwc';

export default class MultipleParametersCompoChild extends LightningElement {

    @api b
    @api a
}