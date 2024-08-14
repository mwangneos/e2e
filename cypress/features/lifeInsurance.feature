Feature: get quote for life insurance

    Background: user is on the life insurance start page

    @medibank
    @controlTest
    @beneficiaryNomination
    @emailVerification
    @documentVerification
    @membershipVerification
    Scenario: medibank life policy is created with member discount and beneficiary displayed in policy schedule file
        Given I start a new application of medibank life insurance
        And I click 'Yes' to 'confirm I am an existing medibank member'
        When I provide my basic personal information with age of '29'
            | firstName             | lastName | dateOfBirth | email                                        | gender | smokeStatus | state |        
            | medilifeinsuredperson | autotest | forever29   | medilifeinsuredperson@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$5''.56' 'fortnight'
        And I should be able to see 'member discount applied'
        And I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 500000       |
        And I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my member number then wait for validation
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed' 
        And I fill in my height and weight
            | height | weight |
            | 162    | 94     |
        And I go through eligibility criteria questions with answer 'No' to existing 'Life' cover question
            | residingInAus | existingLifeCover |
            | agree         | no                |
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
            | awaitingTest | injury | awaitingSurgery | claim | declinedHistory |
            | none         | none   | none            | none  | no              |
        And I provide medical history in last 5 years then click 'Continue'
            | history | historyContinued | pregnant |
            | none    | none             | no       | 
        And I provide other general medical information without genetic test then click 'Continue'   
            | geneticTest | familyHistory | drug | hazardous |
            | no          | none          | none | no        | 
        And I tick the checkbox to 'confirm the information I provided' then click 'Continue'
        Then I should be able to see 'Thank you for your Medibank life insurance application.'
        And I should be able to see total premium is '$5''.56' 'fortnight' 
        And I should be able to see 'Loading - 50%'
        When I click 'Continue' to 'confirm I would like to proceed'
        And I confirm policy owner and my origin then click 'Continue'
        Then I should be able to see 'Beneficiaries'
        And I nominate '1' beneficiaries by filling in beneficiary details then click 'Continue'
            | firstName       | lastName | dateOfBirth | relationship | proportion | streetAddress | suburb    | postcode | state| 
            | medibeneficiary | autotest | 03081982    | Child        | 100        | 1 spring road | melbourne | 3000     | VIC  |
        And I tick the checkbox to 'declare' then click 'Continue'
        Then I should be able to see 'Payment details'
        When I click 'Direct Debit' to 'confirm payment method'
        And I fill in bank account details
            | accountName   | bsb    | bankName | accountNumber |
            | autotest Medi | 013316 | ANZ      | 123456        |
        And I tick the checkbox to 'authorise as policy owner' then click 'Continue'
        And I agree on the policy declaration and click 'Continue'
        Then I should be able to see total premium is '$5''.56' 'fortnight' 
        When I tick the checkbox to 'agree terms and conditions' then click 'Continue'
        Then I should be able to see 'Thanks for choosing Medibank life insurance to protect you and your loved ones!'
        And 'medilifeinsuredperson' should receive ', welcome to Medibank Life Insurance!' email with 'Policy schedule' link
        When  I click the link to download 'medipolicySchedule' file
        And I use my date of birth as age of '29' to open 'medipolicySchedule' file
        Then I should be able to see 'medibeneficiary autotest' in the 'medipolicySchedule' file
        And I should be able to see 'Policy anniversary date' in the 'medipolicySchedule' file
        And I should be able to see 'Expiry date' in the 'medipolicySchedule' file
        And I should be able to see 'Fortnightly' in the 'medipolicySchedule' file
        And I should be able to see 'Loadings - 50%' in the 'medipolicySchedule' file
        And I should be able to see a future date with '0' years from current date in the 'medipolicySchedule' file
        And I should be able to see a future date with '1' years from current date in the 'medipolicySchedule' file
        And I should be able to see a future date with '71' years from current date in the 'medipolicySchedule' file

    @pvt
    @ahm
    @controlTest
    @policyOwnerNomination
    @emailVerification
    @smsVerification
    @documentVerification
    @yearlyPremium
    Scenario: ahm life policy is created from 'Retrieve quote link' with policy owner and displayed in policy schedule file
        Given I start a new application of ahm life insurance
        And I click 'No' to 'confirm I am not an existing ahm member'
        When I provide my basic personal information with age of '39'
            | firstName        | lastName | dateOfBirth | email                                   | gender | smokeStatus | state |
            | ahminsuredperson | autotest | forever39   | ahminsuredperson@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$12''.20' 'fortnight'
        And 'ahminsuredperson' should receive ', we’ve saved your ahm life insurance quote' email with 'Retrieve my quote' link
        When I click the link and input my date of birth as age of '39' then click 'Validate' to continue my quote
        And I provide occupation and annual income
            | occupation  | annualIncome | 
            | chiropodist | 500000       |
        And I click 'Continue' to 'proceed'    
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed' 
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'No' to existing 'Life' cover question
            | residingInAus | existingLifeCover |
            | agree         | no                |
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
            | awaitingTest | injury | awaitingSurgery | claim | declinedHistory |
            | none         | none   | none            | none  | no              |
        And I provide medical history in last 5 years then click 'Continue'
            | history | historyContinued | pregnant |
            | none    | none             | no       | 
        And I provide other general medical information without genetic test then click 'Continue'   
            | geneticTest | familyHistory | drug | hazardous |
            | no          | none          | none | no        |      
        And I tick the checkbox to 'confirm the information I provided' then click 'Continue'
        Then I should be able to see 'Thank you for your ahm life insurance application.'
        And I should be able to see total premium is '$12''.20' 'fortnight'
        When I click 'Continue' to 'confirm I would like to proceed'
        And I nominate policy owner by filling in owner details then click 'Continue'
            | firstName          | lastName | contactNumber | email                                     | relationship |
            | ahmlifepolicyowner | autotest | 0487654321    | ahmlifepolicyowner@szxu2q77.mailosaur.net | spouse       |
        Then I should be able to see 'Payment details'
        When I click 'Direct Debit' to 'confirm payment method'
        And I click 'Yearly' to 'confirm payment frequency'
        And I fill in bank account details
            | accountName  | bsb    | bankName | accountNumber |
            | autotest ahm | 013316 | ANZ      | 123456        |
        And I tick the checkbox to 'authorise as policy owner' then click 'Continue'
        And I agree on the policy declaration and click 'Continue'
        Then I should be able to see total premium is '$294''.60' 'year' 
        And I tick the checkbox to 'agree terms and conditions' then click 'Continue'
        Then I should be able to see 'Thanks for choosing ahm life insurance to protect you and your loved ones!'
        And 'ahmlifepolicyowner' should receive ', welcome to ahm life insurance!' email with 'Policy schedule' link
        When  I click the link to download 'ahmpolicySchedule' file
        And I use my date of birth as age of '39' to open 'ahmpolicySchedule' file
        Then I should be able to see 'ahmlifepolicyowner' in the 'ahmpolicySchedule' file
        And I should be able to see 'Expiry date' in the 'ahmpolicySchedule' file
        And I should be able to see 'Annual' in the 'ahmpolicySchedule' file
        And I should be able to see '$' in the 'ahmpolicySchedule' file
        And I should be able to see a future date with '0' years from current date in the 'ahmpolicySchedule' file
        And I should be able to see a future date with '1' years from current date in the 'ahmpolicySchedule' file

    @ahm
    @emailVerification
    Scenario: ahm life policy is declined due to medical eligibility
        Given I start a new application of ahm life insurance
        And I click 'No' to 'confirm I am not an existing ahm member'
        When I provide my basic personal information with age of '42'
            | firstName       | lastName | dateOfBirth | email                                  | gender | smokeStatus | state |       
            | ahmlifedeclined | autotest | forever42   | ahmlifedeclined@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$18''.75' 'fortnight'
        When I click 'Continue' to 'proceed'
        And I provide occupation and annual income
            | occupation  | annualIncome | 
            | chiropodist | 90000        |
        And I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed' 
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     | 
        And I go through eligibility criteria questions with answer 'No' to existing 'Life' cover question
            | residingInAus | existingLifeCover |
            | agree         | no                |
        And I click 'Continue' to 'proceed'
        When I tick medical condition 'A neurological condition' then click 'Continue'
        And I tick the checkbox to 'declare that the information provided is true' then click 'Continue'
        Then I should be able to see 'Unable to offer cover'
        And I should be able to see 'Medical eligibility'
        And I should be able to see total premium is '$0''.00' 'fortnight'
        When I click 'Continue' to 'proceed'
        Then I should be able to see 'we regret to advise that your application was unsuccessful'
        And I should be able to see 'Medical eligibility'
        And 'ahmlifedeclined' should receive ', an update on your life insurance application' email with 'Application decision' link
        When I click the link and enter code from sms message then click 'Validate'
        Then I should be able to see 'we are unable to provide insurance to you at this time due to your disclosure(s) below.'
        And I should be able to see 'Medical eligibility'

