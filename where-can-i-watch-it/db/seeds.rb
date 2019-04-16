# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Apostle', :rating => 'Netflix', :release_date => '12-Oct-2018', :imgurl => 'apostle_poster.jpg'},
    	  {:title => 'Like Father', :rating => 'Netflix', :release_date => '3-Aug-2018', :imgurl => 'like_father.jpg'},
    	  {:title => 'Outlaw King', :rating => 'Netflix', :release_date => '9-Nov-2018', :imgurl => 'outlaw_king_poster.jpg'},
      	  {:title => 'A Land Imagined', :rating => 'Netflix', :release_date => '12-Apr-2019', :imgurl => 'imagined_land.jpg'},
      	  {:title => 'The Perfect Date', :rating => 'Netflix', :release_date => '12-Apr-2019', :imgurl => 'perfect_date.jpg'},
      	  {:title => 'The Silence', :rating => 'Netflix', :release_date => '10-Apr-2019', :imgurl => 'the_silence.jpg'},
      	  {:title => 'Roma', :rating => 'Netflix', :release_date => '21-Nov-2018', :imgurl => 'roma.jpg'},
      	  {:title => 'Mother!', :rating => 'Hulu', :release_date => '15-Sep-2017', :imgurl => 'mother.jpg'},
      	  {:title => 'Silence', :rating => 'Hulu', :release_date => '13-Jan-2017', :imgurl => 'silence.jpg'},
      	  {:title => 'Shoplifters', :rating => 'Hulu', :release_date => '23-Nov-2018', :imgurl => 'shoplifters.jpg'},
      	  {:title => 'Assassination Nation', :rating => 'Hulu', :release_date => '21-Sep-2018', :imgurl => 'assassination_nation.jpg'},
      	  {:title => 'Fyre Fraud', :rating => 'Hulu', :release_date => '14-Jun-2019', :imgurl => 'fyre_fraud.jpg'},
      	  {:title => 'A Quiet Place', :rating => 'PrimeVideo', :release_date => '6-Apr-2018', :imgurl => 'quiet_place.jpg'},
      	  {:title => 'It Comes At Night', :rating => 'PrimeVideo', :release_date => '9-Jun-2017', :imgurl => 'it_comes_at_night.jpg'},
      	  {:title => 'MHA: Two Heroes', :rating => 'PrimeVideo', :release_date => '25-Sep-2018', :imgurl => 'two_heroes.jpg'},
      	  {:title => 'City of Ghosts', :rating => 'PrimeVideo', :release_date => '21-Jul-2017', :imgurl => 'city_of_ghosts.jpg'},
      	  {:title => 'Arrival', :rating => 'PrimeVideo', :release_date => '12-Nov-2016', :imgurl => 'arrival.jpg'},
      	  {:title => 'Zama', :rating => 'PrimeVideo', :release_date => '28-Sep-2017', :imgurl => 'zama.jpg'},
      	  {:title => 'The Thinning', :rating => 'Youtube', :release_date => '12-Oct-2016', :imgurl => 'thinning.jpg'},
      	  {:title => 'Holmes and Watson', :rating => 'Youtube', :release_date => '24-Dec-2018', :imgurl => 'holmes.jpg'},
      	  {:title => 'Glass', :rating => 'Youtube', :release_date => '18-Jan-2019', :imgurl => 'glass.jpg'},
      	  {:title => 'Escape Room', :rating => 'Youtube', :release_date => '4-Jan-2019', :imgurl => 'escape_room.jpg'},
      	  {:title => 'Into The Spiderverse', :rating => 'Youtube', :release_date => '14-Dec-2018', :imgurl => 'spiderverse.jpg'},
      	  {:title => 'Vice', :rating => 'Youtube', :release_date => '25-Dec-2018', :imgurl => 'vice.jpg'}
      	  
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end
