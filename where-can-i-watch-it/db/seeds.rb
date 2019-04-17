# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Apostle', :rating => 'Netflix', :release_date => '12-Oct-2018', :imgurl => 'apostle_poster.jpg', :favcounter => 0},
    	  {:title => 'Like Father', :rating => 'Netflix', :release_date => '3-Aug-2018', :imgurl => 'like_father.jpg', :favcounter => 0},
    	  {:title => 'Outlaw King', :rating => 'Netflix', :release_date => '9-Nov-2018', :imgurl => 'outlaw_king_poster.jpg', :favcounter => 0},
      	  {:title => 'A Land Imagined', :rating => 'Netflix', :release_date => '12-Apr-2019', :imgurl => 'imagined_land.jpg', :favcounter => 0},
      	  {:title => 'The Perfect Date', :rating => 'Netflix', :release_date => '12-Apr-2019', :imgurl => 'perfect_date.jpg', :favcounter => 0},
      	  {:title => 'The Silence', :rating => 'Netflix', :release_date => '10-Apr-2019', :imgurl => 'the_silence.jpg', :favcounter => 0},
      	  {:title => 'Roma', :rating => 'Netflix', :release_date => '21-Nov-2018', :imgurl => 'roma.jpg', :favcounter => 0},
      	  {:title => 'Mother!', :rating => 'Hulu', :release_date => '15-Sep-2017', :imgurl => 'mother.jpg', :favcounter => 0},
      	  {:title => 'Silence', :rating => 'Hulu', :release_date => '13-Jan-2017', :imgurl => 'silence.jpg', :favcounter => 0},
      	  {:title => 'Shoplifters', :rating => 'Hulu', :release_date => '23-Nov-2018', :imgurl => 'shoplifters.jpg', :favcounter => 0},
      	  {:title => 'Assassination Nation', :rating => 'Hulu', :release_date => '21-Sep-2018', :imgurl => 'assassination_nation.jpg', :favcounter => 0},
      	  {:title => 'Fyre Fraud', :rating => 'Hulu', :release_date => '14-Jun-2019', :imgurl => 'fyre_fraud.jpg', :favcounter => 0},
      	  {:title => 'A Quiet Place', :rating => 'PrimeVideo', :release_date => '6-Apr-2018', :imgurl => 'quiet_place.jpg', :favcounter => 0},
      	  {:title => 'It Comes At Night', :rating => 'PrimeVideo', :release_date => '9-Jun-2017', :imgurl => 'it_comes_at_night.jpg', :favcounter => 0},
      	  {:title => 'MHA: Two Heroes', :rating => 'PrimeVideo', :release_date => '25-Sep-2018', :imgurl => 'two_heroes.jpg', :favcounter => 0},
      	  {:title => 'City of Ghosts', :rating => 'PrimeVideo', :release_date => '21-Jul-2017', :imgurl => 'city_of_ghosts.jpg', :favcounter => 0},
      	  {:title => 'Arrival', :rating => 'PrimeVideo', :release_date => '12-Nov-2016', :imgurl => 'arrival.jpg', :favcounter => 0},
      	  {:title => 'Zama', :rating => 'PrimeVideo', :release_date => '28-Sep-2017', :imgurl => 'zama.jpg', :favcounter => 0},
      	  {:title => 'The Thinning', :rating => 'Youtube', :release_date => '12-Oct-2016', :imgurl => 'thinning.jpg', :favcounter => 0},
      	  {:title => 'Holmes and Watson', :rating => 'Youtube', :release_date => '24-Dec-2018', :imgurl => 'holmes.jpg', :favcounter => 0},
      	  {:title => 'Glass', :rating => 'Youtube', :release_date => '18-Jan-2019', :imgurl => 'glass.jpg', :favcounter => 0},
      	  {:title => 'Escape Room', :rating => 'Youtube', :release_date => '4-Jan-2019', :imgurl => 'escape_room.jpg', :favcounter => 0},
      	  {:title => 'Into The Spiderverse', :rating => 'Youtube', :release_date => '14-Dec-2018', :imgurl => 'spiderverse.jpg', :favcounter => 0},
      	  {:title => 'Vice', :rating => 'Youtube', :release_date => '25-Dec-2018', :imgurl => 'vice.jpg', :favcounter => 0}
      	  
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end
