/*] If Case status is “New” and Origin is “Phone”  Product should be “GC1020”.
- If Case status is “Working” and Origin is “Web”  Product should be “GC1060”.
If Case status is “Escalated” and Origin is “Email”  Show Error “This case can not be escalated” */
trigger CaseTrigger_04 on Case (before insert, before update) {
    for(Case objCase : trigger.new){
        if(!string.isBlank(objCase.status) && string.isNotBlank(ObjCase.Origin)){
            if(objCase.status == 'New' && objCase.Origin == 'Phone'){
                objCase.product__c = 'GC1020';
            }else{
                if(objCase.status == 'Working' && objCase.Origin == 'Web'){
                     objCase.product__c = 'GC1060';
                }
                else{
                    if(objCase.status == 'Escalated' && objCase.Origin == 'Email'){
                        objCase.AddError('This case can not be escalated');
                    }
                }
            }
        }
    }
}