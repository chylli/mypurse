Feature: Configure flow

  As a user
  I want to sign in and configure something
  So that change the behaviour of app

  @wip @javascript
  Scenario: confgure language
    When I signed in with a valid user
    And I visit the configure language page
    And I filled the 'Preferred Language' with 'zh'
    And I click the 'Update' button
    Then it will display '语言'

