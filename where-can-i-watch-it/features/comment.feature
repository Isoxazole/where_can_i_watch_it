Feature: Comment
When a user attempts to comment on a movie, they will be able to post their comment
  on the movie's page for others to see.

  Scenario: The user creates a comment on a movie's page
    Given the user is on a movie's page and enters their name and comment
    When the the user clicks the submit button
    Then the user should see their comment created on the movie's page.

  Scenario: The user deletes a comment on a movie's page
    Given the user is on a movie's page and deletes their comment
    When the the user clicks the delete button
    Then the user should see their comment deleted from the movie's page.

  Scenario: The user edits a comment on a movie's page
    Given the user is on a movie's page and edits their comment
    When the the user clicks the edit button
    Then the user should see their comment edited on the movie's page.

