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

# Search Tests
module SearchStepHelper
	def search
		
	end
end
Given("the movie can be found in the database") do|movie|
	 Movie.any?(:title.downcase => movie.downcase)
  @movie = movie
end

When("the user searches for the movie") do
	params[:search]
end

Then("the user should see the movies details.") do
	'movie displays in table'
end

Given("the movie cannot be found in the database") do
	"Move false when check if in db"
end

Then("the user should no results.") do
	"Empty db"
end
