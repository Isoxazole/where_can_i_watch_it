require 'cucumber/rails'
require 'capybara'
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
	def delete_user
	  @user ||= User.where(:email => @visitor[:email]).first
	  @user.destroy unless @user.nil?
	end
	def sign_up
	  delete_user
	  #fill_in "user_name", :with => @visitor[:name]
	  fill_in "user_email", :with => @visitor[:email]
	  fill_in "user_password", :with => @visitor[:password]
	  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
	  click_button "Sign up"
	  find_user
	end
	def load_database
	    load File.join(Rails.root, 'db', 'seeds.rb')
	end    
end

World FavoritesStepHelper

#Scenario: the user wants to see their favorites list
    Given ("the user is located on the main movies page") do
        visit "/"
        page.should have_xpath('/')
    end
    When ("the user is logged in") do
        create_visitor
        visit "/users/sign_up"
        sign_up
        page.should have_content "Supported Services:"
    end
    Then("the user should see the 'favorites' tab being displayed") do
        expect(page).to have_content(@visitor[:email])
    end
    And ("the user navigates to their favorites list") do
        click_link('Favorites', :href => "/favorites")
    end
    
#Scenario: the user wants to see their favorites list but are not logged in  
    Given ("the user is on the main movies page") do
        visit "/"
    end
    When ("the user is not logged in") do
        create_visitor
        visit "/users/sign_up"
        sign_up
        visit "/"
        click_link('Log Out', :href => "/users/sign_out")
        page.should_not have_content(@visitor[:email])
    end
    Then ("the user should not see the 'favorites' tab displayed") do
        page.should_not have_content "Favorites"
    end


#Scenario: the user adds a movie to their favorites list
    Given ("the user is on the movies page and is logged in") do 
        load_database
        create_visitor
        visit "/users/sign_up"
        sign_up
        visit "/"
        page.should have_content "Supported Services:"
    end
    When ("the user navigates to a movie's page") do
        page.should have_content "Apostle"
        click_link(:href => "/movies/1")
        page.should have_content "Details about Apostle"
    end
    Then ("the user presses the 'add to favorites button'") do
        page.should have_content("Add to favorites")
        click_link("Add to favorites")
    end
    And ("the movie is added to their favorites list") do
        page.should have_content("Remove from favorites")
    end
    
#Scenario: the user removes a movie to their favorites list
    Given ("the user is on a movies page and is logged in") do
        load_database
        create_visitor
        visit "/users/sign_up"
        sign_up
        visit "/"
        click_link(:href => "/movies/1")
        page.should have_content "Details about Apostle"
    end
    When ("the user presses the 'remove from favorites button'") do
        page.should have_content("Add to favorites")
        click_link("Add to favorites")
        page.should have_content("Remove from favorites")
        click_link("Remove from favorites")
    end
    Then ("the movie is removed from their favorites list") do
        page.has_link?("Add to favorites")
    end

#Scenario: the user wants to add a movie to their favorites list, but is not logged in
    Given ("the user is on a movies page and is not logged in") do
        load_database
        visit "/"
        create_visitor
        page.should_not have_content (@visitor[:email])
    end
    When ("the user searches for the 'add to favorites button'") do
        click_link(:href => "/movies/1")
        page.should have_content "Details about Apostle"
    end
    Then ("the 'add to favorites button' should not be visable") do
        page.should_not have_content("Add to favorites")
    end