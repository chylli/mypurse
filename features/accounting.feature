Feature: Accounting flow

  As a user
  I want to signin and make accounting.

  Scenario: transactions page access
    Given I signed in with a valid user
    When I visit the homepage
    And I click the 'Accounting' link
    Then it will redirect to the accounting index page
