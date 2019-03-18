
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
	  visit '/users/sign_up'
	  fill_in "user_name", :with => @visitor[:name]
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
	  click_button "Sign in"
	end
end

World LoginStepHelper
##
Given("the user enters an email for new account") do
    create_visitor
end 
When("the email is not already taken") do
    sign_up
end
Then("the account is created") do
    page.should have_content "Welcome! You have signed up successfully."
end
##
Given("the user enters a username for new account") do
    create_visitor
end
When("the username is already taken") do
    sign_up
end
Then("the account is not created") do
    page.should have_content "Email is invalid or already taken."
end    
##
Given("the user enters password ") do
end    
When("the user enters correct password") do
end
Then("the user is able to login") do
    page.should have_content "Signed in successfully."
end
##   
Given("the user enters password") do
end
When("the password is incorrect") do
end
Then("the user is not able to login") do
      page.should have_content "Invalid email or password."
end