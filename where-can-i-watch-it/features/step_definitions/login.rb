require 'cucumber/rails'
require 'rubygems'
require 'devise'

module LoginStepHelper
    
	def create_visitor
	  @visitor ||= { :name => "testname", :email => "test@test.com",
	    :password => "testpass", :password_confirmation => "testpass" }
	end
	def find_user
	  @user ||= User.where(:email => @visitor[:email]).first
	end
	def create_unconfirmed_user
	  create_visitor
	  delete_user
	  sign_up
	  visit '/users/sign_out'
	end
	def create_user
	  create_visitor
	  delete_user
	  @user = FactoryGirl.create(:user, @visitor)
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
end

World LoginStepHelper

##

# the user wants to navigate to the login/ sign-up page
Given ("the user is on the root page") do
	visit "/"
	page.should have_content "Login/Signup"
end
When ("the user clicks the 'login/ sign-up' button") do
	click_link('Login/Signup', :href => "/users/sign_in")
end
Then ("the user is directed to the login page") do
	page.should have_content "Log in"
end
    
# the user wants to log in
Given ("the user is located on the login/ sign-up page") do
	create_visitor
	visit '/users/sign_in'
	page.should have_content "Log in"
end
When ("the user completes log in form and clicks the login button") do
	sign_in
end
Then ("the user is logged in and redirected back to the main page") do
	page.has_title? "index.html.erb"
end

# the user wants to sign up
Given ("the user is located on the login/ signup page") do
	create_visitor
	visit "/users/sign_in"
end
When ("the user navigates to the sign-in page") do
	click_link('Sign up', :href => "/users/sign_up")
	page.has_title? "/users/sign_up"
end 
Then ("the user completes the form and clicks the sign-up button") do
	sign_up
end
And ("the user is signed up, logged in, and redirected back to the main page") do
	page.has_title? "index.html.erb"
end
    
# the user wants to see if they are logged in
Given ("the user has logged in") do
	visit "/"
	create_visitor
	sign_in
end
When ("the user is redirected to the home page") do
	page.has_title? "index.html.erb"
end
Then ("the user's email is displayed at the top page") do
	click_link(@visitor[:email], :href => "/users/edit")
	#find_button(@visitor[:email])
	
end
And ("the 'log out' button appears") do
	find_button('Log out')
end
    
# the user wants to see if they are logged in
Given ("the user has not logged in") do
end
When ("the user is on the main page") do
end
Then ("the user's email is not displayed at the top page") do
end
And ("the 'log out' button does not appear") do
end 
