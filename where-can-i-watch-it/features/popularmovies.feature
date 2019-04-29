Feature: Popular Movies
    A feature to allow a user to see what movie pages have been favorited the most
    
    
Scenario: A movies has been favorited by many users
    Given the user has favorited a movie
    When the user navigates to the 'Popular movies' page
    Then the movie the user favorited is displayed

Scenario: A movies has not been favorited by users
    Given the user has not favorited a movie
    When the user relocates to the 'Popular movies' page
    Then the movie is not displayed on the page