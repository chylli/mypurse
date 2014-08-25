Feature: Configure flow

  As a user
  I want to sign in and configure something
  So that change the behaviour of app

  Scenario: configure language
    When I signed in with a valid user
    And I visit the configure language page
    And I filled the 'Preferred Language' with 'zh'
    And I click the 'Update' button
    Then it will display '语言'

  Scenario: create account
    When I signed in with a valid user
    And I visit the configure accounts page
    And I fill the 'Name' with 'test account'
    And I click the 'Create Account' button
    Then it will display 'test account'

  Scenario: create property category
    When I signed in with a valid user
    And I visit the configure page
    And I click the link 'Property Categories'
    And I fill the 'Name' with 'test category'
    And I select the 'Parent' with 'Property Center'
    And I click the 'Create Property category' button
    Then it will display 'test category'
    And it will display 'Parent: Property Center'

  Scenario: create liability category
    When I signed in with a valid user
    And I visit the configure page
    And I click the link 'Liability Categories'
    And I fill the 'Name' with 'test category'
    And I select the 'Parent' with 'Liability Center'
    And I click the 'Create Liability category' button
    Then it will display 'test category'
    And it will display 'Parent: Liability Center'

  Scenario: create earning category
    When I signed in with a valid user
    And I visit the configure page
    And I click the link 'Earning Categories'
    And I fill the 'Name' with 'test category'
    And I select the 'Parent' with 'Earning'
    And I click the 'Create Earning category' button
    Then it will display 'test category'
    And it will display 'Parent: Earning'
  Scenario: create Expense category
    When I signed in with a valid user
    And I visit the configure page
    And I click the link 'Expense Categories'
    And I fill the 'Name' with 'test category'
    And I select the 'Parent' with 'Expense'
    And I click the 'Create Expense category' button
    Then it will display 'test category'
    And it will display 'Parent: Expense'
