Feature: login
    A feature to allow a user who is logged in to add a movie to their favorites list
    
    
Scenario: the user adds a movie to their favorites list
    Given the is on the movies page
    When they press the "add to favorites button"
    Then the movie is added to their favorites list
    
Scenario: the user removes a movie to their favorites list
    Given the is on the favorites page
    When they press the "remove from favorites button"
    Then the movie is removed from their favorites list   

Scenario: the user adds a movie to their favorites list, but is not logged in
    Given the is on the movies page
    When they press the "add to favorites button"
    Then the movie is not added to their favorites list, and are requested to log in
