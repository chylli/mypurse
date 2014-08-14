Feature: Configure flow

  As a user
  I want to sign in and configure something
  So that change the behaviour of app

  @javascript
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

  @wip
  Scenario: create account category
    When I signed in with a valid user
    And I visit the configure page
    And I click the link 'Account Categories'
    And I fill the 'Name' with 'test category'
    And I click the 'Create Category' button
    Then it will display 'test category'

