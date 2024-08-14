Feature: service portal - client view

    Scenario: a new quote can be saved and submitted by adviser and cancelled by ops successfully
        Given I logged into service portal as 'adviser' user
        Then I should be able to see 'Welcome back to the NEOS Policy Servicing Portal'
        When I navigate to 'Inforce quoting' page via 'Client' of client '2'
        Then I should be able to see 'Aaliyah Adams'
        When I click to add a new quote for client '2'
        Then I should be able to see 'Please make at least one change'
        And I reduce the sum insured amount to '4996'
        And I click 'Save' to 'proceed'
        When I navigate to 'Inforce quoting' page
        Then I should be able to see 'Active Quote'
        And I click Load to view the saved quote
        Then I should be able to see 'Reference'
        And I click 'Submit' to 'proceed'
        Then I should be able to see 'Declaration'
        And I tick the checkbox to confirm the request then click Submit
        When I navigate to 'Inforce quoting' page
        Then I should be able to see 'Submitted Quote'
        When I click 'Logout' from menu
        And I logged into service portal as 'ops' user
        And I click 'Submitted requests' from menu
        And I search for the target request
        And I click Load to view the submitted request
        And I click 'Cancel' to 'proceed'
        When I navigate to 'Inforce quoting' page
        Then I should be able to see 'Cancelled Quote'
        When I click 'Logout' from menu
        And I logged into service portal as 'adviser' user
        When I navigate to 'Inforce quoting' page via 'Client' of client '2'
        Then I should be able to see 'Cancelled Quote'

    Scenario: a new request of updating client summary can be submitted by adviser and cancelled by ops successfully
        Given I logged into service portal as 'adviser' user
        Then I should be able to see 'Welcome back to the NEOS Policy Servicing Portal'
        When I navigate to 'Client summary' page via 'Client' of client '2'
        Then I should be able to see 'Aaliyah Adams'
        When I click update to popup the details
        And I update the email field
        And I tick the checkbox to confirm the request then click Submit
        Then I should be able to see 'Submitted client details update'
        And I should be able to see the updated email address
        When I click 'Logout' from menu
        And I logged into service portal as 'ops' user
        And I click 'Submitted requests' from menu
        And I search for the target request
        And I click Load to view the submitted request
        And I click 'Cancel' to 'proceed'
        Then I should be able to see 'Cancelled client details update'
        And I should be able to see the updated email address

    Scenario: a new quote can be submitted by adviser and actioned by ops successfully
        Given I logged into service portal as 'adviser' user
        Then I should be able to see 'Welcome back to the NEOS Policy Servicing Portal'
        When I navigate to 'Inforce quoting' page via 'Client' of client '1'
        Then I should be able to see 'Aaliyah Adams'
        When I click to add a new quote for client '1'
        Then I should be able to see 'Please make at least one change'
        And I reduce the sum insured amount to '6000'
        And I click 'Submit' to 'proceed'
        Then I should be able to see 'Declaration'
        And I tick the checkbox to confirm the request then click Submit
        When I navigate to 'Inforce quoting' page
        Then I should be able to see 'Submitted Quote'
        When I click 'Logout' from menu
        And I logged into service portal as 'ops' user
        And I click 'Submitted requests' from menu
        And I click Load to view the submitted request
        And I click 'Action' to 'proceed'
        When I navigate to 'Inforce quoting' page
        Then I should be able to see 'Actioned Quote'

    Scenario: a new request of updating payment details can be submitted by adviser and cancelled by ops successfully
        Given I logged into service portal as 'adviser' user
        Then I should be able to see 'Welcome back to the NEOS Policy Servicing Portal'
        When I navigate to 'Payment details' page via 'Client' of client '3'   
        Then I should be able to see 'Credit Card'
        And I click update to popup the details
        And I click 'Direct Debit' to 'update the payment method'
        Then I should be able to see 'Payment Authority'
        And I input the bank account details
        And I tick the checkbox to confirm the request then click Submit
        Then I should be able to see 'Submitted payment details update'
        When I click 'Logout' from menu
        And I logged into service portal as 'ops' user
        And I click 'Submitted requests' from menu
        And I search for the target request
        And I click Load to view the submitted request
        And I click 'Cancel' to 'proceed'
        When I navigate to 'Payment details' page
        Then I should be able to see 'Cancelled payment details update'