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
public with sharing class TreeLocationControllerTest 
{
    @TestSetup
    static void makeData()
    {
        Tree__c tree = new Tree__c(Name='Banyan Tree', Benefit__c='Dummy Benefits Here', Picture__c='');
        insert tree;
        
        City__c city = new City__c(Name='Jaiput');
        insert city;

        //Tree_Plantation__c treePlantation = new Tree_Plantation__c(Name='Plantation', Tree__c=tree.ID, City__c=city.ID);
        //insert treePlantation;
    }

    @isTest
    static void myUnitTest() 
    {
        // The second line shows is a little shortcut
        //TreeLocationController.getTreeLocations(treePlantation.ID);
        TreeLocationController.getTreeLocations('JustGetTheTest'); 
        
        
        // NEW feature Added from the DEV so it can get all the way to PROD
        System.debug('Greetings my friend'); 
    }
}