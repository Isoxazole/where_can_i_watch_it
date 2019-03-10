Feature: Search
    When a user attempts to search for a movie, they will see the movies details.

Scenario: The user searches for a movie that can be found in the Utelly API
    Given the movie can be found in the Utelly API
    When the searches for the movie
    Then the user should see the movies details.

Scenario: The user searches for a movie that cannot be found in the Utelly API
    Given the movie cannot be found in the Utelly API
    When the searches for the movie
    Then the user should no results.