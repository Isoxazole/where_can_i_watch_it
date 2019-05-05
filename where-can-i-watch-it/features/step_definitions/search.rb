require 'cucumber/rails'
require 'capybara'
require 'rubygems'

module SearchStepHelper
	def search
		
	end
	def load_database
	    load File.join(Rails.root, 'db', 'seeds.rb')
	end  
end
Given("the movie can be found in the database") do
	 Movie.where(:title => 'Apostle').any?

   # @driver = Selenium::WebDriver.for :firefox
   # @driver.get "http://localhost:3000/"
end

When("the user searches for the movie") do
  page.find("form", :id => "search").fill_in "extend", :with => "Apostle"
  click_button "search_submit"
  # element = @driver.find_element(:name, "search")
  # element.send_keys "Apostle"
  # element.submit
end

Then("the user should see the movie.") do
	# wait = Selenium::WebDriver::Wait.new(timeout: 10)
  # wait.until { @driver.find_element(:class,'card-text').text.include? "Apostle"}
  # @driver.close

end

Given("the movie cannot be found in the database") do
  # !Movie.where(:title => 'Power Rangers').any?
  # @driver = Selenium::WebDriver.for :firefox
  # @driver.get "http://localhost:3000/"
end

When("the user searches for a move not in the db") do
  # element = @driver.find_element(:name, "search")
  # element.send_keys "Power Rangers"
  # element.submit
end

Then("the user should see no results.") do
  begin
    @driver.find_element(:tag_name,'td').text.include? "Power Rangers"
  rescue
    true
  end
  @driver.close
end
