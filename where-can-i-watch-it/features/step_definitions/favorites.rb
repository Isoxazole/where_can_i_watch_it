require 'cucumber/rails'
require 'rubygems'

module FavoritesStepHelper

    def create_visitor
	  @visitor ||= { :name => "testname", :email => "test@test.com",
	    :password => "testpass", :password_confirmation => "testpass" }
	end
	
    def sign_in
	  visit '/users/sign_in'
	  fill_in "user_email", :with => @visitor[:email]
	  fill_in "user_password", :with => @visitor[:password]
	  click_button "Log in"
	end
	session = Capybara.current_session
end

World FavoritesStepHelper

#Scenario: the user wants to see their favorites list
    Given ("the user is located on the main movies page") do
        visit "/"
        page.has_title? "index.html.erb"
    end
    When ("the user is logged in") do
        create_visitor
        sign_in
        page.has_title? "index.html.erb"
        Capybara.current_session.has_link?(@visitor[:email], href: "/users/edit")
    end
    Then("the user should see the 'favorites' tab being displayed") do
        Capybara.current_session.has_link?("Favorites", href: "/favorites")
    end
    And ("the user navigates to their favorites list") do
        Capybara.current_session.click_link("Favorites", href: "/favorites")
        page.has_title? "/favorites"
    end
    
#Scenario: the user wants to see their favorites list but are not logged in  
    Given ("the user is on the main movies page") do
        visit "/"
        page.has_title? "index.html.erb"
    end
    When ("the user is not logged in") do
        create_visitor
        page.should_not have_content (@visitor[:email])
    end
    Then ("the user should not see the 'favorites' tab displayed") do
        page.should_not have_content "Favorites"
    end
    
#Scenario: the user adds a movie to their favorites list
    Given ("the user is on the movies page and is logged in") do
        create_visitor
        sign_in
        page.has_title? "index.html.erb"
    end
    When ("the user navigates to a movie's page") do
        #Capybara.current_session.visit("/movies/1")
        #Capybara.current_session.click_link(alt: "Apostle poster")
        #click_button("Apostle poster")
        #find(:xpath, "//div/a[@href='/movies/1']").click
        #find(:xpath, "img[alt='Apostle poster']").click
        #Capybara.current_session.click_link('', href: nil)
        #find(:xpath, "//a/img[@alt='Apostle poster']/..").click
        #find(:xpath, "//a/img[@alt='Apostle poster']").click 
        #page.find("img[alt='Apostle poster']").click
        page.has_title? "/movies/1"
    end
    Then ("the user presses the 'add to favorites button'") do
        page.has_link?("Add to favorites")
        click_link("Add to favorites")
    end
    And ("the movie is added to their favorites list") do
        page.has_link?("Remove from favorites")
    end
    
#Scenario: the user removes a movie to their favorites list
    Given ("the user is on a movies page and is logged in") do
        create_visitor
        sign_in
        page.has_title? "index.html.erb"
        rake db:migrate
        rake db:seed
        visit "/movies/1"
    end
    When ("the user presses the 'remove from favorites button'") do
        #page.has_link?("Add to favorites")
        #click_link("Add to favorites")
        page.has_link?("Remove from favorites")
        click_link("Remove from favorites")
    end
    Then ("the movie is removed from their favorites list") do
        page.has_link?("Add to favorites")
    end

#Scenario: the user wants to add a movie to their favorites list, but is not logged in
    Given ("the user is on a movies page and is not logged in") do
        
    end
    When ("the user searches for the 'add to favorites button'") do
        
    end
    Then ("the 'add to favorites button' should not be visable") do
        
    end