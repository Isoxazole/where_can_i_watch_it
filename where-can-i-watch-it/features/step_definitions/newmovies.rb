require 'cucumber/rails'
require 'capybara'
require 'rubygems'

module NewMovieStepHelper

	def load_database
	    load File.join(Rails.root, 'db', 'seeds.rb')
	end   
	
end

World NewMovieStepHelper

#Scenario: A movies has been released with 365 days of the current date
    Given ("the user is on the home page") do
        load_database
        visit "/"
    end
    When ("the user navigates to the 'New movies' page") do
        click_link('New', :href => "/recent_releases")
    end
    Then ("the movie is displayed on the new movies page") do
        page.should have_content("Fyre Fraud")
    end
    

#Scenario: A movies has not been released with 365 days of the current date
    Given ("the user is located on the home page") do
        visit "/"
    end
    When ("the user moves to the 'New movies' page") do
        click_link('New', :href => "/recent_releases")
    end
    Then ("the movie is not displayed on the new movies page") do
        page.should_not have_content("Apostle")
    end