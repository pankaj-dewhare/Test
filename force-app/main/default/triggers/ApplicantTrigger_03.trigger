//Take backup of APPLICANT object. Only if Applicant was eligible for Police Verification, DOB month is July or Nov and Gender is “Male” or “Female”.
trigger ApplicantTrigger_03 on Applicant__c (after delete) {
    list<Applicant_Backup__c> appBkList = New list<Applicant_Backup__c>();
    For(Applicant__c objApp : trigger.old){
        if(objApp.police_verification__c == true && (objApp.DOB__c.month() == 7 || objApp.DOB__c.month() == 11) && (objApp.gender__c == 'male' || objApp.gender__c == 'Female')){
            Applicant_Backup__c objAppBK = new Applicant_Backup__c();
            objAppBk.DOB__c = objApp.DOB__c;
            objAppBk.gender__c = objApp.gender__c;
            objAppBk.police_verification__c = objApp.police_verification__c;
            appBkList.add(objAppBK);
            
        }
        else{
         objApp.AddError('Record can not be deleted');   
        }
    }
    if(!appBkList.isEmpty()){
        database.insert(appBKList,false);
    }
}