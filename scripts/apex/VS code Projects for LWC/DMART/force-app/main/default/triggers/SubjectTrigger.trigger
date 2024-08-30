trigger SubjectTrigger on Subject__c (before insert, before update, after undelete) {
    set<Id> studIdSet = new set<Id>();
    for(Subject__c objSub : trigger.new){
        if((trigger.isBefore && trigger.isInsert) || (trigger.isAfter && trigger.isUndelete)){
            if(objSub.Student_Name__c != null){
                studIdSet.add(objSub.Student_Name__c);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
        if((objSub.subject_name__c != trigger.oldMap.get(objSub.id).subject_name__c) || (objSub.student_name__c != trigger.oldMap.get(objSub.Id).student_name__c)){
            studIdSet.add(objSub.student_name__c);
        }
       }
    }
    map<Id,Student__c> studentMap = new map<Id,Student__c>();
    if(!studIdSet.isEmpty()){
        For(Student__c objStud : [Select Id, (Select Id, Subject_name__c From Subjects__r) From student__c Where ID IN : studIdSet]){
            studentMap.put(objStud.id, objStud);
        }
    }
    if(!studentMap.isEmpty()){
        for(Subject__c objSub : trigger.new){
            if(studentMap.containskey(objSub.student_name__c)){
                list<Subject__c> subList = studentMap.get(objSub.student_name__c).Subjects__r;
                
                for(Subject__c objSubExisting : subList){
                    if(objSub.subject_name__c == objSubExisting.subject_name__c){
                        objSub.addError('Duplicate subject foundddd...!!!');
                    }
                }
            }
        }
    }
}