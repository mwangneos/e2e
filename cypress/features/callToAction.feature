Feature: call to action links are redirecting user to OPP

@cta
    Scenario: medibank and ahm call to action links are redirecting user to OPP
        Given I am on medibank 'life-insurance/c/life/' home page
        When I click 'Get a quick quote'
        Then I should be able to see 'Your Insurance Quote'
        And I should be able to see 'Are you an existing Medibank Private Health Insurance member?'
        Given I am on medibank 'income-protection/' home page
        When I click 'Get a quick quote'
        Then I should be able to see 'Your Insurance Quote'
        And I should be able to see 'Are you an existing Medibank Private Health Insurance member?'
        Given I am on ahm 'life-insurance' home page
        Then I should be able to click and redirect to get a quick quote for ''
        Given I am on ahm 'income-protection-insurance' home page
        Then I should be able to click and redirect to get a quick quote for '/income'
