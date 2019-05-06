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
   load_database
	 Movie.where(:title => 'Apostle').any?

end

When("the user searches for the movie") do
  load_database
  visit "/"
  fill_in("extend", :with => "Apostle")
  click_button "search_submit"

end

Then("the user should see the movie.") do
  page.should have_content "Apostle"

end

Given("the movie cannot be found in the database") do
  !Movie.where(:title => 'Power Rangers').any?
  visit "/"

end

When("the user searches for a move not in the db") do
  fill_in("extend", :with => "Power Rangers")
  click_button "search_submit"
end

Then("the user should see no results.") do
  page.should_not have_content "Power Rangers"

end
