Feature: Search
    When a user attempts to search for a movie, they will see the movies details.

Scenario: The user searches for a movie that can be found in the db
    Given the movie can be found in the database
    When the user searches for the movie
    Then the user should see the movie.

Scenario: The user searches for a movie that cannot be found in db
    Given the movie cannot be found in the database
    When the user searches for a move not in the db
    Then the user should see no results.