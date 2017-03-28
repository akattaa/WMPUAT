@IsTest(SeeAllData = true)
public class AccountTriggerTest {
    
    static testMethod void before_update_Account() {
		
		
		 // declare local vars
        Account account = new Account();
        String customerRtId = '';
        String customerRtIdTest = '';
        
        // retrieve the customer account record type
        customerRtId = [select id from RecordType where IsActive = true and SObjectType = 'Account' and DeveloperName = 'Customer'].Id;
        
        // populate the record
        account.RecordTypeId = customerRtId;
        account.Name = 'TEST CODE CUSTOMER ACCOUNT ONE';
        account.BillingState = 'Pennsylvania';
        account.Client_Code__c = EtheriosUtility.generateRandomString(5);
        account.Planned_Won_Opportunity_Amount__c = 100;
        account.ParentId = '0013900001SOYeNAAX';
        // insert the record
        insert account;

        account.Planned_Won_Opportunity_Amount__c = 1000;
        update account;
		
		//test.stopTest();
	}

}