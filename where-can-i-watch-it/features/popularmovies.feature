Feature: Popular Movies
    A feature to allow a user to see what movie pages have been viewed the most
    
    
Scenario: A movies has been viewed by users X times
    Given the user is on the popular page
    Then the movie is displayed on the popular page
    

Scenario: A movies has not been viewed by users X times
    Given the user is on the popular page
    Then the movie is not displayed on the popular page