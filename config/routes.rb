Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/comedians', to: 'comedians#index'
  get '/comedians/new', to: 'comedians#new'
  post '/comedians', to: 'comedians#create'

  # get '/comedians', to: 'comedians#index'
  # User Story 1
  #
  # As a visitor
  # When I visit `/comedians`
  # Then I see a list of comedians with the following
  # information for each comedian:
  #   * Name
  #   * Age
  #   * City
  #
  # - Data does not have to be accurate to real life - you can make this up, or grab the information from the internet.
  # - The city attribute can hold birthplace or current known hometown.
  # - For testing, you should ensure that the name, age and city only appear on a
  #   specific area of the page for that single comedian.

  # User Story 2
  #
  # As a visitor
  # When I visit `/comedians`
  # Then I also see a list of each comedian's TV specials, including
  #   * Name of the special
  #   * Run Time of the special in minutes
  #
  # - You may find this information on IMDB.com and other related sites.
  # - Your project does not need to include *every* special the comedian has ever made.

  # User Story 3
  #
  # As a visitor
  # When I visit `/comedians`
  # I see a thumbnail image for each comedian
  #
  # - Image locations (URLs) can be stored in the database as a string.
  # - Use the image URLs from IMDB or other online source for the special
  # - Use CSS styling to scale the image smaller if needed to fit on the page

  # get '/comedians?age=:age', to: 'comedians#show'
  # User Story 4
  #
  # As a visitor
  # When I visit `/comedians?age=34`
  # Then I see the list of comedians on the page only shows
  # comedians who match the age criteria.
  #
  # - All other information on the page is still expected to be present
  # - Testing should check that excluded comedians do not show up.

  # User Story 5
  #
  # As a visitor
  # When I visit `/comedians`
  # For each comedian, I see a count of their TV specials

  #post '/comedians', to: 'comedians#create' #### Does this need to precede next line?
  # get '/comedians/new', to: 'comedians#new'
  # User Story 6
  #
  # As a visitor
  # When I visit `/comedians/new`
  # Then I see a form to input a new comedian into the database
  # Including fields for their name, age and city.
  # When the form is successfully submitted and saved,
  # Then I am redirected to `/comedians`
  # And I see the new comedian's data on the page.


  # User Story 7
  #
  # As a visitor
  # When I visit `/comedians`
  # Then I see an area at the top of the page called 'Statistics'
  # In that 'Statistics' area, I see the following information:
  # - the average age of all comedians on the page (if the page is filtered for specific comedians, the statistics should reflect the new group)
  # - a unique list of cities for each comedian on the page
  #
  # Averaging and uniqueness should be done in ActiveRecord NOT
  # using Ruby


  # User Story 8
  #
  # As a visitor
  # When I visit `/comedians?age=34`
  # Then I see a list of all comedians with an age of 34
  # Just like a previous User Story, BUT all other statistics
  # information in the 'Statistics' area of the page should be limited
  # to reflect only the information about the comedians listed on
  # the page.
  #
  # - Testing should ensure that calculated statistics are
  #   correct for a limited subset of data



  # Extensions

  # As a user, when I visit `/comedians`,
  # I see all previous information
  # And each comedian's name is a link to a page that only shows
  # that comedian's information and TV specials.
  #
  # For example, comedian #4 in your database would have a page like
  # `/comedians/4`
  #
  # - Testing should check that only this one comedian's information
  #   is on the page.


  # As a user, when I visit `/comedians`,
  # I see all previous information
  # And, in the statistics area:
  # - A total count of specials for all comedians on the page
  # - the average run length of every TV special on the page


  # As a user, when I visit `/comedians?sort=name`
  # Then I see all previous information, but all comedians are
  # sorted alphabetically by the name of the comedians.


  # As a user, when I visit `/comedians?sort=city`
  # Then I see all previous information, but all comedians are
  # sorted alphabetically by the name of their city.


  # As a user, when I visit `/comedians?sort=age`
  # Then I see all previous information, but all comedians are
  # sorted alphabetically by the age of the comedian.


end
