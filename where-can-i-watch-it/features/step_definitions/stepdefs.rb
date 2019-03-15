module LockoutStepHelper
	def lockout
	end
end
World LockoutStepHelper

Given("the incorrect password was entered {int} times") do |attempts|
	@attempts = 1
end
When("the user attempts to log in again") do
	@password = lockout
	
end
Then("the user should be locked out of the account with the message {string}") do |message|
	puts @message
end


Given("the correct password is entered") do
	@attempts = 1
end
When("the user clicks enter") do
	@password = @actual_password
end
Then("the user is granted access into the account") do
	'Logged in successfully'
end

Given("the username is not already taken") do
	pending # Write code here that turns the phrase above into concrete actions
end

When("the user enters a username for new account") do
	pending # Write code here that turns the phrase above into concrete actions
end

Then("the account is created") do
	pending # Write code here that turns the phrase above into concrete actions
end

Given("the username is already taken") do
	pending # Write code here that turns the phrase above into concrete actions
end

Then("the account is not created") do
	pending # Write code here that turns the phrase above into concrete actions
end

Given("the user password is correct") do
	pending # Write code here that turns the phrase above into concrete actions
end

When("the user enters in the correct password") do
	pending # Write code here that turns the phrase above into concrete actions
end

Then("the user is able to login") do
	pending # Write code here that turns the phrase above into concrete actions
end

Given("the user password is not correct") do
	pending # Write code here that turns the phrase above into concrete actions
end

When("the user enters in the wrong password") do
	pending # Write code here that turns the phrase above into concrete actions
end

Then("the user is not able to login") do
	pending # Write code here that turns the phrase above into concrete actions
end



# Search Tests
module SearchStepHelper
	def search
		
	end
end
Given("the movie can be found in the Utelly API") do
	pending # Write code here that turns the phrase above into concrete actions
end

When("the searches for the movie") do
	pending # Write code here that turns the phrase above into concrete actions
end

Then("the user should see the movies details.") do
	pending # Write code here that turns the phrase above into concrete actions
end

Given("the movie cannot be found in the Utelly API") do
	pending # Write code here that turns the phrase above into concrete actions
end

Then("the user should no results.") do
	pending # Write code here that turns the phrase above into concrete actions
end

