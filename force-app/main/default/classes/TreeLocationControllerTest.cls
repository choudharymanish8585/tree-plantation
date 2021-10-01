/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
public with sharing class TreeLocationControllerTest {
    @TestSetup
    static void makeData(){
        Tree__c tree = new Tree__c(Name='Banayan Tree', Benefit__c='Dummy Benefit',Picture__c ='');
        insert tree;
        City__c city = new City__c(Name='Jaipur', Location__Latitude__s = 26.912, Location__Longitude__s = 76.787);
        insert city;
        Tree_Plantation__c treePlantation = new Tree_Plantation__c(Planted_In__c = city.Id, Tree__c = tree.Id);
        insert treePlantation;
        
    }
    @isTest
    public static void testGetTreeLocations() {
        // TO DO: implement unit test
        Test.startTest();
        
        List<Tree__c> trees = [SELECT Id, Name FROM Tree__c];
        List<Tree_Plantation__c> treePlantations = TreeLocationController.getTreeLocation((String)trees[0].id);
        Test.stopTest();
        System.assertEquals('Banayan Tree',trees[0].Name, 'The tree name does not match');
        system.assertEquals('Jaipur', treePlantations[0].Planted_In__r.Name, 'Plantation name does not match');

    }
}