Feature: Accounting flow

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
    Then it will redirect to the accounting index page
#    And it will display 'transaction1'

  Scenario: Show accounts when click a category
    Given I signed in with a valid user
    #And I create account 'account_cash' under category 'Cash'
    And I visit the accounting index page
    And I click the link 'Cash'
    Then it will display 'testcash1'
    When I click the link 'testcash1'
    Then it will display the button 'Submit' 



