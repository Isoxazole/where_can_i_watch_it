require 'cucumber/rails'
require 'rubygems'

module FavoritesStepHelper

    def create_visitor
	  @visitor ||= { :name => "testname", :email => "test@test.com",
	    :password => "testpass", :password_confirmation => "testpass" }
	end
	
    def sign_in
	  visit '/users/sign_in'
	  fill_in "user_email", :with => @visitor[:email]
	  fill_in "user_password", :with => @visitor[:password]
	  click_button "Log in"
	end
end

World FavoritesStepHelper

#Scenario: the user wants to see their favorites list
    Given ("the user is on the main movies page") do
        
    end
    When ("the user is logged in") do
        
    end
    Then("the user should see the 'favorites' tab being displayed") do
        
    end
    And ("the user navigates to their favorites list") do
        
    end
    
#Scenario: the user wants to see their favorites list but are not logged in  
    Given ("the user is on the main movies page") do
        
    end
    When ("the user is not logged in") do
        
    end
    Then ("the user should not see the 'favorites' tab displayed") do
        
    end
    
#Scenario: the user adds a movie to their favorites list
    Given ("the user is on the movies page and is logged in") do
        
    end
    When ("the user navigates to a movie's page") do
        
    end
    Then ("the user presses the 'add to favorites button'") do
        
    end
    And ("the movie is added to their favorites list") do
        
    end
    
#Scenario: the user removes a movie to their favorites list
    Given ("the user is on a movies page and is logged in") do
        
    end
    When ("the user presses the 'remove from favorites button'") do
        
    end
    Then ("the movie is removed from their favorites list") do
        
    end

#Scenario: the user wants to add a movie to their favorites list, but is not logged in
    Given ("the user is on a movies page and is not logged in") do
        
    end
    When ("the user searches for the 'add to favorites button'") do
        
    end
    Then ("the 'add to favorites button' should not be visable") do
        
    end