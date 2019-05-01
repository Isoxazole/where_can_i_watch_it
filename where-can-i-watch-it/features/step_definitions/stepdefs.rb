require 'rubygems'
require 'selenium-webdriver'
require 'cucumber/rails'

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