require 'cucumber/rails'

module FavoritesStepHelper

    def create_visitor
	  @visitor ||= { :name => "testname", :email => "test@test.com",
	    :password => "testpass", :password_confirmation => "testpass" }
	end
	
    def sign_in
	  visit '/users/sign_in'
	  fill_in "user_email", :with => @visitor[:email]
	  fill_in "user_password", :with => @visitor[:password]
	  click_button "Sign in"
	end
end

World FavoritesStepHelper

#   Scenario: the user adds a movie to their favorites list
Given("the user is on the movies page") do
    create_visitor
    sign_in
    visit "/movies/1"
    page.should have_content "Aladdin"
    
end
When("the user presses the 'add to favorites button'") do
    click_button "Favorites link"
    page.should_not have_content "Favorites link"
end
Then("the movie is added to their favorites list") do
    page.should have_content "Remove from favorites"
end
    
#   Scenario: the user removes a movie to their favorites list
Given("the is on the favorites page") do
end
When("the user presses the 'remove from favorites button'") do
end
Then("the movie is removed from their favorites list") do
end   

#   Scenario: the user adds a movie to their favorites list, but is not logged in
Given("the is on the movies page") do
end
When("the user press the 'add to favorites button'") do
end
Then("the movie is not added to their favorites list, and are requested to log in") do
end
