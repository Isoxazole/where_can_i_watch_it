Feature: Filter
    A feature to allow a user to filter movies shown on the homepage by provider
    
Scenario: the user selects to filter by a provider 
    Given the user is in the main movies page
    When the user selects what provider to filter by and presses 'filter'
    Then the movies displayed should only belong to selected providers
    
Scenario: the user selects to 'Clear'
    Given the user is located in the main movies page
    When the user selects what provider to filter by and presses 'Clear' instead
    Then all movies should be displayed
