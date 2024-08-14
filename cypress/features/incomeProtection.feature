Feature: get quote for income protection

    Background: user is on the income protection start page

    @pvt
    @medibank
    @emailVerification
    @smsVerification
    @documentVerification
    @monthlyPremium
    Scenario: medibank income policy is created from 'Retrieve quote link' and insured person is displayed in application summary file
        Given I start a new application of medibank 'income' protection
        And I click 'No' to 'confirm I am not an existing medibank member'
        When I provide my basic personal information with age of '29'
            | firstName              | lastName | dateOfBirth | email                                         | gender | smokeStatus | state |       
            | medibankincomeretrieve | autotest | forever29   | medibankincomeretrieve@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I provide occupation and annual income
            | occupation  | annualIncome  |
            | chiropodist | 120000        |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$36''.92' 'fortnight'
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
        And 'medibankincomeretrieve' should receive ', we’ve saved your Medibank life insurance quote' email with 'Retrieve my quote' link
        When I click the link and enter code from sms message then click 'Validate'
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
        And I should be able to see total premium is '$36''.92' 'fortnight'
        And 'medibankincomeretrieve' should receive ' an update on your life insurance application' email with 'Application summary' link
        When I click the link to download 'mediapplicationSummary' file
        And I use my date of birth as age of '29' to open 'mediapplicationSummary' file
        Then I should be able to see 'medibankincomeretrieve' in the 'mediapplicationSummary' file
        When I click 'Continue' to 'confirm I would like to proceed'
        And I confirm policy owner and my origin then click 'Continue'
            | policyOwner | aboriginal        | beneficiaryNomination |
            | yes         | Prefer not to say |    no                 |
        And I click 'Continue' to 'skip beneficiary nomination' 
        Then I should be able to see 'Payment details'
        When I click 'Direct Debit' to 'confirm payment method'
        And I click 'Monthly' to 'confirm payment frequency'
        And I fill in bank account details
            | accountName   | bsb    | bankName | accountNumber |
            | autotest Medi | 013316 | ANZ      | 123456        |
        And I tick the checkbox to 'authorise as policy owner' then click 'Continue'
        And I agree on the policy declaration and click 'Continue'
        Then I should be able to see total premium is '$80''.20' 'month' 
        When I tick the checkbox to 'agree terms and conditions' then click 'Continue'
        Then I should be able to see 'Thanks for choosing Medibank life insurance to protect you and your loved ones!'

    @medibank
    @emailVerification
    @smsVerification
    Scenario: medibank income policy is declined due to disqualified weight
        Given I start a new application of medibank 'income' protection
        And I click 'No' to 'confirm I am not an existing medibank member'
        When I provide my basic personal information with age of '42'
            | firstName          | lastName | dateOfBirth | email                                     | gender | smokeStatus | state |        
            | mediincomedeclined | autotest | forever42   | mediincomedeclined@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 120000       |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$50''.92' 'fortnight'
        When I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed' 
        And I fill in my height and weight
            | height | weight |
            | 162    | 162    | 
        And I click 'Continue' to 'proceed'
        And I tick the checkbox to 'declare that the information provided is true' then click 'Continue'
        Then I should be able to see 'Unable to offer cover'
        And I should be able to see 'height and weight'
        And I should be able to see total premium is '$0''.00' 'fortnight'
        When I click 'Continue' to 'proceed'
        Then I should be able to see 'we regret to advise that your application was unsuccessful'
        And I should be able to see 'height and weight'
        And 'mediincomedeclined' should receive ', an update on your life insurance application' email with 'Application decision' link
        When I click the link and enter code from sms message then click 'Validate'
        Then I should be able to see 'Based on the responses to the questions you provided, we regret to advise that your application was unsuccessful'
        And I should be able to see 'If you were eligible for Interim Accident Cover, this has now ceased effective immediately'

    @ahm
    @multipleCovers
    @toggleOnAndOff
    Scenario: ahm income policy is created from 'Retrieve quote link' with adding life cover
        Given I start a new application of ahm 'income' protection
        And I click 'No' to 'confirm I am not an existing ahm member'
        When I provide my basic personal information with age of '35'
            | firstName         | lastName | dateOfBirth | email                                    | gender | smokeStatus | state |        
            | ahmincomemultiple | autotest | forever35   | ahmincomemultiple@szxu2q77.mailosaur.net | Female | Non-smoker  | VIC   |
        And I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 160000       |
        And I click 'Get Quote' to 'proceed'
        Then I should be able to see total premium is '$55''.20' 'fortnight'
        And I should be able to see cover amount is '8,000' for 'income protection' on slider bar
        And 'ahmincomemultiple' should receive ', we’ve saved your ahm life insurance quote' email with 'Retrieve my quote' link
        When I click the link and input my date of birth as age of '35' then click 'Validate' to continue my quote
        And I click to add 'life' cover
        Then I should be able to see cover amount is '500,000' for 'life cover' on slider bar
        And I should be able to see total premium is '$66''.01' 'fortnight'
        And I click 'Continue' to 'proceed'
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I click 'Continue' to 'proceed' 
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'No' to existing 'Life and Income' cover question
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
        And I should be able to see total premium is '$66''.01' 'fortnight' 
        When I toggle 'off life' cover
        Then I should be able to see total premium is '$55''.20' 'fortnight' 
        When I toggle 'on life' cover
        Then I should be able to see total premium is '$66''.01' 'fortnight' 
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
        Then I should be able to see total premium is '$66''.01' 'fortnight' 
        When I tick the checkbox to 'agree terms and conditions' then click 'Continue'
        Then I should be able to see 'Thanks for choosing ahm life insurance to protect you and your loved ones!'