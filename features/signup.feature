Feature: User Signup Flow
  As a user
  I want to signup as a new member

  Scenario: signup success
    When I visit the signup page
    And I fill the 'name' with 'user1'
    And I fill the 'email' with 'user1@test.com'
    And I fill the 'password' with 'password'
    And I fill the 'password_confirmation' with 'password'
    And I select the 'language' with 'en'
    And I click the 'Signup' button
    Then it will redirect to the root page
    And it will display 'user1'

  Scenario: signup failed
    When I visit the signup page
    And I fill the 'name' with 'user1'
    And I fill the 'email' with 'user1@test.com'
    And I fill the 'password' with 'ps'
    And I fill the 'password_confirmation' with 'password'
    And I select the 'language' with 'en'
    And I click the 'Signup' button
    Then it will display 'should be 6 to 20 characters'
