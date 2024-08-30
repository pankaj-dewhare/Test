/*2] If Case status is “New” and Origin is “Phone”  Product should be “GC1020”.
- If Case status is “Working” and Origin is “Web”  Product should be “GC1060”.
If Case status is “Escalated” and Origin is “Email”  Show Error “This case can not be escalated”
*/
trigger CaseTrigger on Case (before insert, Before update) {
    For(Case objCase : trigger.new){
        if(!string.isBlank(objCase.status) && !string.isBlank(objCase.Origin)){
            if(ObjCase.status == 'New' && objCase.Origin == 'Phone'){
                objCase.Product__c = 'GC1020';
            }
            else{
                if(objCase.status == 'Working' && objCase.Origin == 'Web'){
                    objCase.Product__c = 'GC1060';
                }
                else{
                    if(objCase.status == 'Escalated' && objCase.origin == 'Email'){
                        objCase.Product__c.AddError('This case can not be escalated');
                    }
                }
            }
        }
    }
}