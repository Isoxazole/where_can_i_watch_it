Feature: login
    A feature to allow a user who is logged in to add a movie to their favorites list
    
Scenario: the user wants to see their favorites list
    Given the user is on the main movies page
    When the user is logged in
    Then the user should see the "favorites" tab being displayed
    And the user navigates to their favorites list
    
Scenario: the user wants to see their favorites list but are not logged in  
    Given the user is on the main movies page
    When the user is not logged in
    Then the user should not see the "favorites" tab displayed
    
Scenario: the user adds a movie to their favorites list
    Given the user is on the movies page and is logged in
    When the user navigates to a movie's page
    Then the user presses the "add to favorites button"
    And the movie is added to their favorites list
    
Scenario: the user removes a movie to their favorites list
    Given the user is on a movie's page and is logged in
    When the user presses the "remove from favorites button"
    Then the movie is removed from their favorites list   

Scenario: the user wants to add a movie to their favorites list, but is not logged in
    Given the user is on a movie's page and is not logged in
    When the user searches for the "add to favorites button"
    Then the "add to favorites button" should not be visable
