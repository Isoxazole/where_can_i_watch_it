require 'cucumber/rails'
require 'capybara'
require 'rubygems'

module PopularMoviesStepHelper
def create_visitor
	  @visitor ||= { :name => "testname", :email => "test@test.com",
	    :password => "testpass", :password_confirmation => "testpass" }
	end
	def find_user
	  @user ||= User.where(:email => @visitor[:email]).first
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
	def sign_in
	  visit '/users/sign_in'
	  fill_in "user_email", :with => @visitor[:email]
	  fill_in "user_password", :with => @visitor[:password]
	  click_button "Log in"
	end
	def load_database
	    load File.join(Rails.root, 'db', 'seeds.rb')
	end   
	
end

World PopularMoviesStepHelper

#Scenario: A movies has been favorited by many users
    Given ("the user has favorited a movie") do
        load_database
        create_visitor
        visit "/users/sign_up"
        sign_up
        click_link(:href => "/movies/1")
        page.should have_content "Details about Apostle"
        click_link("Add to favorites")
        visit "/"
    end
    When ("the user navigates to the 'Popular movies' page")do
        click_link('Popular', :href => "/popular")
        page.should_not have_content "Include:"
    end
    Then ("the movie the user favorited is displayed") do
        page.should have_content "Apostle"
    end

#Scenario: A movies has not been favorited by users
    Given ("the user has not favorited a movie") do
        visit "/"
    end
    When ("the user relocates to the 'Popular movies' page") do
        click_link('Popular', :href => "/popular")
        page.should_not have_content "Include:"
    end
    Then ("the movie is not displayed on the page") do
        page.should_not have_content "glass"
    end    