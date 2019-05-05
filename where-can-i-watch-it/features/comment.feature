Feature: Allows a user to input and view comments from the user and other users.

  Scenario: The user creates a comment on a movies page
    Given the user is on a certain movies page
    When the user enters their comment and clicks the submit button
    Then the user should see their comment created on the movies page

    
  Scenario: The user deletes a comment on a movies page
    Given the user is on a new movies page
    When the user clicks the delete button
    Then the user should see their comment deleted from the movies page
    
  Scenario: the user is not logged in and attempts to post a comment
    Given the user is on a distinct movies page and is not logged in
    When the user attempts to post a comment
    Then the user is redirected to the login page

