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

#   Scenario: the user adds a movie to their favorites list
Given("the user is on the movies page") do
    create_visitor
    sign_in
    visit '/'
    
    #page.find_by_id("Poster").has_text?("Apostle")
    #page.all(".articles .article[id='foo']")
    #find('div.strong', text: 'Apostle')
    #page.find('div', text: 'Apostle', visible: :false)
    #within('strong.card-text') do
    #    page.body.should have_content ('Apostle')
    #end
    #page.find('strong', text: 'Apostle', exact: true)
    #find("div", match: :first)
    #page.find('#div')['card-text', card-text == "Apostle"]
    #page.find('strong.card-text', text: 'Apostle')
    #find('div.card text-white bg-dark mb-3').click
    
end
When("the user presses the 'add to favorites button'") do
    click_button "Favorites link"
    page.should_not have_content "Add to favorites"
end
Then("the movie is added to their favorites list") do
    page.should have_content "Add to favorites"
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
