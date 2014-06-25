Feature: User Signin Flow

  As a user
  I want to signin and see the special content for me
  So that I visit the site, 

  Scenario: signin success
    Given a user named user1
    When I signin with user1's email and user1's password
    Then it will display 'Welcome to mypurse, user1'

  Scenario: signin failed
    Given a user named user1
    And a user named user2
    When I signin with user1's email and user2's password
    Then it will display 'Invalid email/password combination'

  Scenario: username displayed when signed in
    When I signed in with a valid user
    And I visit the root page
    Then it will display that user's name

  Scenario: update user information need authentication again
    When I signed in with a valid user
    And I visit the edit user page
    And I click the 'Update' button
    Then it will display 'Current password is invalid'
    When I filled the 'Current Password' with correct password
    And I click the 'Update' button
    Then it will display 'User was successfully updated'

  Scenario: update user language will change the shown language
    When I signed in with a valid user
    And I visit the edit user page
    When I filled the 'Current Password' with correct password
    And I filled the 'Preferred Language' with 'zh'
    And I click the 'Update' button
    Then it will display '关于'
