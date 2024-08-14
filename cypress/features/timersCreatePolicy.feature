Feature: create policies with different covers

    Background: user is on the life insurance start page
    
    Scenario: Medibank, life + TPD + CI + 5 Child + IP, no membership, female, smoker, policy owner, 3 beneficiaries
        Given I start a new application of medibank life insurance
        And I click 'No' to 'confirm I am not an existing medibank member'
        When I provide my basic personal information with age of '43'
            | firstName    | lastName     | dateOfBirth    | email        | gender | smokeStatus | state |        
            | useInputData | useInputData | useInputData   | useInputData | Female | Smoker      | VIC   |
        And I click 'Get Quote' to 'proceed'
        When I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 500000       |
        And I click to add 'income protection' cover
        And I click '5 years' to 'confirm benefit period'
        And I click '30 days' to 'confirm waiting period'
        And I click to add 'child' cover
        And I click '5' to 'confirm the number of children'
        And I click to add 'critical illness' cover
        And I click to add 'TPD' cover
        And I click 'Continue' to 'proceed'
        And I verify my mobile number with valid code then click 'Continue'
            | mobile       | code   |
            | useInputData | 123456 |
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I fill in '5' children details
            | firstName | lastName | dateOfBirth |
            | Aaa       | autotest | 26102017    |
            | Bbb       | autotest | 05062015    |
            | Ccc       | autotest | 18122012    |
            | Ddd       | autotest | 01012011    |
            | Eee       | autotest | 05122010    |
        And I click 'Continue' to 'proceed'
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'No' to existing 'Life and Income plus all attached' cover question
        And I fill in '40' working hours per week
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
        And I provide medical history in last 5 years then click 'Continue'
        And I provide other general medical information then click 'Continue'
        And I tick the checkbox to 'confirm the information I provided' then click 'Continue'
        Then I should be able to see 'Thank you for your Medibank life insurance application.'
        When I click 'Continue' to 'confirm I would like to proceed'
        And I confirm policy owner and my origin then click 'Continue'
        Then I should be able to see 'Beneficiaries'
        And I nominate '3' beneficiaries by filling in beneficiary details then click 'Continue'
            | firstName       | lastName | dateOfBirth | relationship | proportion | streetAddress | suburb    | postcode | state | 
            | Aaa             | BeneTest | 01012010    | Child        | 5          | 1 spring road | melbourne | 3000     | VIC   |
            | Bbb             | BeneTest | 01012012    | Child        | 35.1       | 1 spring road | melbourne | 3000     | VIC   |
            | Wife            | BeneTest | 05121980    | Spouse       | 59.9       | 1 spring road | melbourne | 3000     | VIC   |
        And I tick the checkbox to 'declare' then click 'Continue'
        Then I should be able to see 'Payment details'
        
    Scenario: ahm, life + TPD + CI + 5 Child + IP, no membership, female, smoker, not policy owner, no beneficiaries
        Given I start a new application of ahm life insurance
        And I click 'No' to 'confirm I am not an existing medibank member'
        When I provide my basic personal information with age of '43'
            | firstName    | lastName     | dateOfBirth    | email        | gender | smokeStatus | state |        
            | useInputData | useInputData | useInputData   | useInputData | Female | Smoker      | VIC   |
        And I click 'Get Quote' to 'proceed'
        When I provide occupation and annual income
            | occupation  | annualIncome |
            | chiropodist | 500000       |
        And I click to add 'income protection' cover
        And I click '5 years' to 'confirm benefit period'
        And I click '30 days' to 'confirm waiting period'
        And I click to add 'child' cover
        And I click '5' to 'confirm the number of children'
        And I click to add 'critical illness' cover
        And I click to add 'TPD' cover
        And I click 'Continue' to 'proceed'
        And I verify my mobile number with valid code then click 'Continue'
            | mobile       | code   |
            | useInputData | 123456 |
        And I tick the checkbox to 'agree my duty' then click 'Continue'
        And I fill in my mobile number and address on the customer details screen
            | streetAddress      | suburb   | postcode |
            | 697 collins street | melbourne| 3000     |
        And I fill in '5' children details
            | firstName | lastName | dateOfBirth |
            | Aaa       | autotest | 26102017    |
            | Bbb       | autotest | 05062015    |
            | Ccc       | autotest | 18122012    |
            | Ddd       | autotest | 01012011    |
            | Eee       | autotest | 05122010    |
        And I click 'Continue' to 'proceed'
        And I fill in my height and weight
            | height | weight |
            | 162    | 49     |
        And I go through eligibility criteria questions with answer 'No' to existing 'Life and Income plus all attached' cover question
        And I fill in '40' working hours per week
        And I click 'Continue' to 'proceed'
        And I go through medical eligibility then click 'Continue'
        And I provide medical history in last 5 years then click 'Continue'
        And I provide other general medical information then click 'Continue'
        And I tick the checkbox to 'confirm the information I provided' then click 'Continue'
        Then I should be able to see 'Thank you for your ahm life insurance application.'
        When I click 'Continue' to 'confirm I would like to proceed'
        And I nominate policy owner by filling in owner details then click 'Continue'
            | firstName          | lastName | contactNumber | email        | relationship |
            | ahmlifepolicyowner | autotest | 0422222222    | useInputData | spouse       |
        And I tick the checkbox to 'declare' then click 'Continue'
        Then I should be able to see 'Payment details'