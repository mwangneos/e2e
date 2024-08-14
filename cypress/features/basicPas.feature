Feature: manage policies as an admin user

    @ahm
    @smokeTest
    @paymentTransaction
    Scenario: ahm income protection policy can be altered successfully
        Given I start a new application of ahm 'income' protection
        And I click 'No' to 'confirm I am not an existing ahm member'
        When I provide my basic personal information with age of '29'
            | firstName      | lastName | dateOfBirth | email                                 | gender | smokeStatus | state |        
            | basicpasmodify | autotest | forever29   | basicpasmodify@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 250000       |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$59''.07' 'fortnight'
        When I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed'    
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'No' to existing 'Income' cover question
            | residingInAus | existingIncomeCover |
            | agree         | no                  |
        And I fill in '36' working hours per week
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
            | awaitingTest | injury | awaitingSurgery | claim | declinedHistory |
            | none         | none   | none            | none  | no              |
        And I provide medical history in last 5 years then click 'Continue'
            | history | historyContinued | pregnant |
            | none    | none             | no       | 
        And I provide other general medical information then click 'Continue'    
            | familyHistory | drug | hazardous |
            | none          | none | no        |
        And I tick the checkbox to 'confirm the information I provided' then click 'Continue'
        Then I should be able to see 'Thank you for your ahm life insurance application.'
        And I should be able to see total premium is '$59''.07' 'fortnight' 
        When I click 'Continue' to 'confirm I would like to proceed'
        And I confirm policy owner and my origin then click 'Continue'
            | policyOwner | aboriginal        | beneficiaryNomination |
            | yes         | Prefer not to say |    no                 |
        And I click 'Continue' to 'skip beneficiary nomination'    
        Then I should be able to see 'Payment details'
        When I click 'Direct Debit' to 'confirm payment method'
        And I fill in bank account details
            | accountName  | bsb    | bankName | accountNumber |
            | autotest ahm | 013316 | ANZ      | 123456        |
        And I tick the checkbox to 'authorise as policy owner' then click 'Continue'
        And I agree on the policy declaration and click 'Continue'
        Then I should be able to see total premium is '$59''.07' 'fortnight' 
        When I tick the checkbox to 'agree terms and conditions' then click 'Continue'
        Then I should be able to see 'Thanks for choosing ahm life insurance to protect you and your loved ones!'
        And 'basicpasmodify' should receive ', welcome to ahm life insurance!' email with 'Policy schedule' link
        When I logged into PAS as an admin user and navigate to 'dashboard' page to view 'Policies'
        Then I should be able to see 'Policies'
        And I click targeted policy number
        Then I should be able to see 'Cover Specifications'
        When I click 'Payment Details' to 'view the drop down list'
        And I click View Transactions then click the scheduled transaction
        And I click 'Completed' to 'process the transaction'
        And I navigate to dashboard section
        And I click targeted policy number
        And I click 'Alter' to 'change insured person details'
        And I change 'firstName' of the insured person
        And I click 'Apply' to 'proceed'
        And I click 'Confirm & Proceed' to 'proceed'
        And I click Confirm on the popup dialog
        Then I should be able to see 'Policy Number:'
        And I should be able to see the 'changeName' alteration

    @medibank
    @emailVerification
    Scenario: medibank life policy is referred and underwriting task is reassigned successfully
        Given I start a new application of medibank life insurance
        And I click 'No' to 'confirm I am not an existing medibank member'
        When I provide my basic personal information with age of '46'
            | firstName        | lastName | dateOfBirth | email                                   | gender | smokeStatus | state |      
            | basicpasreassign | autotest | forever46   | basicpasreassign@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$26''.37' 'fortnight'
        And I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 160000       |
        And I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed' 
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'Yes' to existing 'Life' cover question
            | Income_LumpSum_TotalLife |
            | 30000000                 |
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
            | awaitingTest | injury | awaitingSurgery | claim | declinedHistory |
            | none         | none   | none            | none  | no              |
        And I provide medical history in last 5 years then click 'Continue'
            | history | historyContinued | pregnant |
            | none    | none             | no       | 
        And I provide other general medical information then click 'Continue'    
            | familyHistory | drug | hazardous |
            | none          | none | no        |  
        And I tick the checkbox to 'declare that the information provided is true' then click 'Continue'
        Then I should be able to see 'Information required'
        When I click 'Continue' to 'proceed'
        Then I should be able to see 'we need some more time to assess your application.'
        And I should be able to see 'Interim Accident Cover'
        And 'basicpasreassign' should receive ', an update on your life insurance application' email with 'Product Disclosure Statement' link
        When I logged into PAS as an admin user and navigate to 'underwriting' page to view 'All Pending Underwriting Tasks'
        And I click targeted policy number
        Then I should be able to see 'Policyholder Details'
        When I click 'Reassign' to 'reassign the task to basicpasreassign'
        And I select 'basicpasreassign' as new assignee
        Then I should be able to see 'Underwriting'

    @ahm
    @emailVerification
    Scenario: ahm income policy is referred and underwriting decision is applied successfully
        Given I start a new application of ahm 'income' protection
        And I click 'No' to 'confirm I am not an existing ahm member'
        When I provide my basic personal information with age of '42'
            | firstName        | lastName | dateOfBirth | email                                   | gender | smokeStatus | state |       
            | basicpasdecision | autotest | forever42   | basicpasdecision@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 90000        |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$37''.43' 'fortnight'
        When I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed' 
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'Yes' to existing 'Income' cover question
            | Financial_IP_Total |
            | 50000              |
        And I fill in '36' working hours per week
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
            | awaitingTest | injury | awaitingSurgery | claim | declinedHistory |
            | none         | none   | none            | none  | no              |
        And I provide medical history in last 5 years then click 'Continue'
            | history | historyContinued | pregnant |
            | none    | none             | no       | 
        And I provide other general medical information then click 'Continue'    
            | familyHistory | drug | hazardous |
            | none          | none | no        |
        And I tick the checkbox to 'declare that the information provided is true' then click 'Continue'
        Then I should be able to see 'Information required'
        And I should be able to see total premium is '$37''.43' 'fortnight'
        When I click 'Continue' to 'proceed'
        Then I should be able to see 'we need some more time to assess your application.'
        And I should be able to see 'Interim Accident Cover'
        And 'basicpasdecision' should receive ', an update on your life insurance application' email with 'Product Disclosure Statement' link
        When I logged into PAS as an admin user and navigate to 'underwriting' page to view 'All Pending Underwriting Tasks'
        And I click targeted policy number
        Then I should be able to see 'Policyholder Details'
        When I select 'Approved' as my decison
        And I click 'Apply Decision' to 'proceed'
        Then I should be able to see 'Underwriting'

    @medibank
    @multipleCovers
    @toggleOnAndOff
    Scenario: medibank policy with multiple covers is cancelled and then reinstated successfully
        Given I start a new application of medibank life insurance
        And I click 'No' to 'confirm I am not an existing medibank member'
        When I provide my basic personal information with age of '35'
            | firstName        | lastName | dateOfBirth | email                                   | gender | smokeStatus | state |       
            | basicpasmultiple | autotest | forever35   | basicpasmultiple@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$11''.26' 'fortnight'
        And I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 160000       |    
        Then I should be able to see total premium is '$11''.26' 'fortnight'
        And I should be able to see cover amount is '500,000' for 'life cover' on slider bar
        When I click to add 'income protection' cover
        Then I should be able to see cover amount is '8,000' for 'income protection' on slider bar
        And I should be able to see total premium is '$68''.76' 'fortnight'
        When I click '5 years' to 'confirm benefit period'
        Then I should be able to see total premium is '$79''.12' 'fortnight'
        When I click '30 days' to 'confirm waiting period'
        Then I should be able to see total premium is '$131''.01' 'fortnight'
        When I click to add 'child' cover
        Then I should be able to see total premium is '$134''.88' 'fortnight'
        When I click '2' to 'confirm the number of children'
        Then I should be able to see total premium is '$138''.76' 'fortnight'
        When I click to add 'critical illness' cover
        Then I should be able to see total premium is '$151''.91' 'fortnight'
        When I click to add 'TPD' cover
        Then I should be able to see total premium is '$160''.34' 'fortnight'
        And I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I fill in '2' children details
            | firstName      | lastName | dateOfBirth |
            | medilifechild1 | autotest | 26102017    |
            | medilifechild2 | autotest | 05062020    |                  
        And I click 'Continue' to 'proceed'
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'No' to existing 'Life and Income plus all attached' cover question
            | residingInAus | existingIncomeCover |
            | agree         | no                  |
        And I fill in '36' working hours per week
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
            | awaitingTest | injury | awaitingSurgery | claim | declinedHistory |
            | none         | none   | none            | none  | no              |
        And I provide medical history in last 5 years then click 'Continue'
            | history | historyContinued | pregnant |
            | none    | none             | no       | 
        And I provide other general medical information then click 'Continue'    
            | familyHistory | drug | hazardous |
            | none          | none | no        |
        And I tick the checkbox to 'confirm the information I provided' then click 'Continue'
        Then I should be able to see 'Thank you for your Medibank life insurance application.'
        And I should be able to see total premium is '$160''.34' 'fortnight' 
        When I toggle 'off income protection' cover
        Then I should be able to see total premium is '$40''.59' 'fortnight' 
        When I toggle 'on income protection' cover
        Then I should be able to see total premium is '$160''.34' 'fortnight' 
        When I click 'Continue' to 'confirm I would like to proceed'
        And I confirm policy owner and my origin then click 'Continue'
            | policyOwner | aboriginal        | beneficiaryNomination |
            | yes         | Prefer not to say | no                    |  
        Then I should be able to see "Beneficiaries"    
        And I click 'Continue' to 'skip beneficiary nomination' 
        Then I should be able to see 'Payment details'
        When I click 'Direct Debit' to 'confirm payment method'
        And I fill in bank account details
            | accountName   | bsb    | bankName | accountNumber |
            | autotest Medi | 013316 | ANZ      | 123456        |
        And I tick the checkbox to 'authorise as policy owner' then click 'Continue'
        And I agree on the policy declaration and click 'Continue'
        Then I should be able to see total premium is '$160''.34' 'fortnight'
        When I tick the checkbox to 'agree terms and conditions' then click 'Continue'
        Then I should be able to see 'Thanks for choosing Medibank life insurance to protect you and your loved ones!'
        And 'basicpasmultiple' should receive ', welcome to Medibank Life Insurance!' email with 'Policy schedule' link
        When I logged into PAS as an admin user and navigate to 'dashboard' page to view 'Policies'
        Then I should be able to see 'Policies'
        And I click targeted policy number
        Then I should be able to see 'Cover Specifications'
        When I click 'Payment Details' to 'view the drop down list'
        And I click View Transactions then click the scheduled transaction
        And I click 'Completed Error' to 'process the transaction'
        And I click 'Agree' to 'confirm the error transaction'
        And I navigate to dashboard section
        And I click targeted policy number
        When I click 'Cancel' to 'cancel the policy'
        Then I should be able to see 'Policy Cancellation'
        And I click 'Cancel Policy' to 'confirm the cancellation'
        Then I should be able to see '$0'
        And I click 'Confirm' to 'acknowledge the refund amount'
        Then I should be able to see 'Cancelled'
        When I click 'Reinstate' to 'reinstate the policy'
        And I click 'Continue' to 'proceed reinstatement of the policy'
        And I tick the checkbox to 'select all covers' then click 'Submit'
        And I make full amount payment via webhook
        Then I should be able to see 'Inforce'