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
