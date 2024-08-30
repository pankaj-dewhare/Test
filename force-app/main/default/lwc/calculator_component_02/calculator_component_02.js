import { LightningElement , track} from 'lwc';

export default class Calculator_component_02 extends LightningElement {
    
    @track num1;
    @track num2;
    @track result

    getDigit1(event)
    {
        
     this.num1 = event.target.value;
     console.log('I am in getDigit1 Method'+this.num1)
    }

    getDigit2(event)
    {
        
     this.num2 = event.target.value;
     console.log('I am in getDigit2 Method'+this.num2)
    }

    performAdd(){
     
        this.result = JSON.parse(this.num1) + JSON.parse(this.num2);
        console.log('Result of addition ='+this.result)
    }

    performSub(){
        this.result = this.num1 - this.num2;
        console.log('Result of Substraction ='+this.result)
    }

    performMul(){
        this.result = this.num1 * this.num2;
        console.log('Result of Multiplication ='+this.result)
    }

    performDiv(){
        this.result = this.num1 / this.num2;
        console.log('Result of Division ='+this.result)
    }
}