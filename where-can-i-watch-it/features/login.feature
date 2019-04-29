Feature: login
    A simple login feature for the website with security encapsulated
    
    
Scenario: the user wants to navigate to the login/ sign-up page
    Given the user is on the root page
    When the user clicks the 'login/ sign-up' button
    Then the user is directed to the login page
    
Scenario: the user wants to log in
    Given the user is located on the login/ sign-up page
    When the user completes log in form and clicks the login button
    Then the user is logged in and redirected back to the main page

Scenario: the user wants to sign up
    Given the user is located on the login/ signup page
    When the user navigates to the sign-in page
    Then the user completes the form and clicks the sign-up button
    And the user is signed up, logged in, and redirected back to the main page
    
Scenario: the user wants to see if they are logged in
    Given the user has logged in
    When the user is redirected to the home page
    Then the user's email is displayed at the top page
    And the 'log out' button appears
    
Scenario: the user wants to see if they are logged in
    Given the user has not logged in
    When the user is on the main page
    Then the user's email is not displayed at the top page
    And the 'log out' button does not appear
