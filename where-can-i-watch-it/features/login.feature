Feature: login
    A simple login feature for the website with security encapsulated
    
    
Scenario: the user creates an account with a unique username
    Given the username is not already taken
    When the user enters a username for new account
    Then the account is created
    
Scenario: the user creates an account with a username already taken
    Given the username is already taken
    When the user enters a username for new account
    Then the account is not created    

Scenario: the user enters in the correct password
    Given the user password is correct
    When the user enters in the correct password
    Then the user is able to login
    
Scenario: the user enters in the incorrect password
    Given the user password is not correct
    When the user enters in the wrong password
    Then the user is not able to login