Feature: New Movies
    A feature to allow a user to see what movies have come out recently
    
    
Scenario: A movies has been released with X days of the current date
    Given the user is on the new movies page
    Then the movie is displayed on the new movies page
    

Scenario: A movies has not been released with X days of the current date
    Given the user is on the new movies page
    Then the movie is not displayed on the new movies page