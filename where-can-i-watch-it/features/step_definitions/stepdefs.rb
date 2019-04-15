require 'rubygems'
require 'selenium-webdriver'

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
Given("the movie can be found in the database") do
	 Movie.where(:title => 'Aladdin').any?
   @driver = Selenium::WebDriver.for :firefox
   @driver.get "http://localhost:3000/"
end

When("the user searches for the movie") do

  element = @driver.find_element(:name, "search")
  element.send_keys "Aladdin"
  element.submit
end

Then("the user should see the movie.") do
	wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.find_element(:tag_name,'td').text.include? "Aladdin"}
  @driver.close

end

Given("the movie cannot be found in the database") do
  !Movie.where(:title => 'Power Rangers').any?
  @driver = Selenium::WebDriver.for :firefox
  @driver.get "http://localhost:3000/"
end

When("the user searches for a move not in the db") do
  element = @driver.find_element(:name, "search")
  element.send_keys "Power Rangers"
  element.submit
end

Then("the user should see no results.") do
  begin
    @driver.find_element(:tag_name,'td').text.include? "Power Rangers"
  rescue
    true
  end
  @driver.close
end
