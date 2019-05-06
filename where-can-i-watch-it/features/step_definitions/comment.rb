require 'cucumber/rails'
require 'capybara'
require 'rubygems'

module CommentStepHelper
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
  def fill_in_comment
    fill_in('comment_body', :with => "This Movie Sucks!!")
    page.click_button("Submit")
  end
	def load_database
	    load File.join(Rails.root, 'db', 'seeds.rb')
	end    
end

World CommentStepHelper


#Scenario: The user creates a comment on a movies page
    Given ("the user is on a certain movies page") do
        load_database
        create_visitor
        visit "/users/sign_up"
        sign_up
        visit "/"
        page.should have_content "Apostle"
        page.click_link(:href => "/movies/1")
        page.should have_content "Details about Apostle"
    end
    When ("the user enters their comment and clicks the submit button") do
        fill_in_comment
    end
    Then ("the user should see their comment created on the movies page") do
        page.should have_content "This Movie Sucks!!"
    end

    
#Scenario: The user deletes a comment on a movies page
    Given ("the user is on a new movies page") do
        load_database
        create_visitor
        visit "/users/sign_up"
        sign_up
        visit "/"
        page.should have_content "Apostle"
        page.click_link(:href => "/movies/1")
        page.should have_content "Details about Apostle"
    end
    When ("the user clicks the delete button") do
        fill_in_comment
        page.click_link("Delete comment")
    end
    Then ("the user should see their comment deleted from the movies page") do
        page.should_not have_content "This Movie Sucks!!"
    end

#Scenario: the user is not logged in and attempts to post a comment
    Given ("the user is on a distinct movies page and is not logged in") do
        load_database
        create_visitor
        visit "/"
        page.should_not have_content(@visitor[:email])
        page.should have_content "Apostle"
        click_link(:href => "/movies/1")
        page.should have_content "Details about Apostle"
    end
    When ("the user attempts to post a comment") do
        page.should have_content "Sign in to post a comment"
    end
    Then ("the user is redirected to the login page") do
        click_link("Sign in to post a comment", :href => "/users/sign_in")
        page.should have_content "Log in"
    end
    