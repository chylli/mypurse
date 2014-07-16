Feature: Transaction flow

  As a user
  I want to signin and booking my transactions.

  @wip
  Scenario: transactions page access
    Given I signed in with a valid user
    When I visit the homepage
    And I click the 'Booking' link
    Then it will redirect to the transactions page
