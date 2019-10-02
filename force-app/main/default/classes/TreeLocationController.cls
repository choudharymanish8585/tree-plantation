public with sharing class TreeLocationController {
    @AuraEnabled(cacheable=true)
    public static List<Tree_Plantation__c> getTreeLocations(String treeId){
        return [SELECT Id, Planted_In__r.Name, Planted_In__r.Location__Latitude__s, Planted_In__r.Location__Longitude__s
                FROM Tree_Plantation__c
                WHERE Tree__c =: treeId];
    }
}