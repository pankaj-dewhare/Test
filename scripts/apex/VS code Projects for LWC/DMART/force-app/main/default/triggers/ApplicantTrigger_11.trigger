/*1] Take backup of APPLICANT object. Only if Applicant was eligible for Police Verification, DOB month is July or Nov and Gender is “Male” or “Female”.
Else prevent it.
*/
trigger ApplicantTrigger_11 on Applicant__c (after delete) {
    list<Applicant_Backup__c> appBkList = New List<Applicant_Backup__c>();
    For(Applicant__c objApp : trigger.old){
        if(objApp.police_verification__c == true && (objApp.DOB__c.month() == 7 || objApp.DOB__c.month() == 11) && (objApp.gender__c == 'Male' || objApp.gender__c == 'Female')){
            Applicant_Backup__c appBk = new Applicant_Backup__c();
            appBk.Police_Verification__c = objApp.police_verification__c;
            appBk.Gender__c = objApp.Gender__c;
            appBk.DOB__c = objApp.DOB__c;
            appBkList.add(appBk);
        }
        else{
            objApp.AddError('Applicant record can not be deleted');
        }
    }
    if(!appBkList.isEmpty()){
        database.insert(appBkList,false);
    }
}