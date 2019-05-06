require 'cucumber/rails'
require 'capybara'
require 'rubygems'

module FilterStepHelper

	def load_database
	    load File.join(Rails.root, 'db', 'seeds.rb')
	end   
	
end

World FilterStepHelper

#Scenario: the user selects to filter by a provider 
    Given ("the user is in the main movies page") do
        load_database
        visit "/"
    end
    When ("the user selects what provider to filter by and presses 'filter'") do
        check('ratings[Netflix]')
        click_button "Refresh"
    end
    Then ("the movies displayed should only belong to selected providers") do
        page.should_not have_content("Mother!")
        page.should_not have_content("A Quite Place")
        page.should_not have_content("Holmes and Watson")
    end
    
#Scenario: the user selects to 'Clear'
    Given ("the user is located in the main movies page") do
        load_database
        visit "/"
    end
    When ("the user selects what provider to filter by and presses 'Clear' instead") do
        check('ratings[Netflix]')
        click_button "Refresh"
        click_button "Clear"
    end
    Then ("all movies should be displayed") do
        page.should have_content("Apostle")
        page.should have_content("Mother!")
        page.should have_content("A Quiet Place")
        page.should have_content("Holmes and Watson")
    end
    