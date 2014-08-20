Feature: Transaction flow

  As a user
  I want to signin and make accounting.

  #TODO
  Scenario: show index content
    Given I signed in with a valid user
#    And I create account 'account1' under category 'Cash'
#    And I create account 'account2' under category 'Cash'
#    And I create transaction 'transaction1' between account 'account1' and account 'account2'
    When I visit the homepage
    And I click the link 'Accounting'
    Then it will redirect to the transactions page
#    And it will display 'transaction1'

  Scenario: Show accounts when click a category
    Given I signed in with a valid user
    And I visit the configure accounts page
    And I fill the 'Name' with 'testcash1'
    And I select the 'Category' with 'Cash'
    And I select the 'Currency' with 'RMB'
    And I click the 'Create Account' button
    #And I create account 'account_cash' under category 'Cash'
    And I visit the transactions page
    And I click the link 'Cash'
    Then it will display 'testcash1'
    When I click the link 'testcash1'
    Then it will display the button 'Submit' 

  @wip
  Scenario: create transaction between two different currency accounts
    Given I signed in with a valid user
    When I visit the configure accounts page
    And I fill the 'Name' with 'rmbcash'
    And I select the 'Category' with 'Cash'
    And I select the 'Currency' with 'RMB'
    And I fill the 'Init balance' with '100'
    And I click the 'Create Account' button
    And I visit the configure accounts page
    And I fill the 'Name' with 'usdcash'
    And I select the 'Category' with 'Cash'
    And I select the 'Currency' with 'USD'
    And I fill the 'Init balance' with '100'
    And I click the 'Create Account' button
    And I visit the transactions page
    And I click the link 'Cash'
    And I click the link 'rmbcash'
    And I select the 'Debit' with 'rmbcash'
    And I select the 'Credit' with 'usdcash'
    And I fill the 'Debit amount' with '10'
    And I fill the 'Credit amount' with '6'
    And I click the 'Submit' button
    Then it will display '10.0'
    And it will display '6.0'
    When I click the link 'rmbcash'
    Then it will display '90.0'
    When I go back
    And I click the link 'usdcash'
    Then it will display '106.0'    



