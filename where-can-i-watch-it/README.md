Where Can I Watch It?

Where Can I Watch It? is a web application developed using rails with the goal to show the user which streaming providers are showing the movie or tv show they want to watch as well as the cost for the user to stream their show. The app also includes a log in page, a comment section which requires the user to have an account to post a comment, favorites section, the ability to like a movie, as well as the ability to filter and search for a movie.

This app was originally designed to have an API on the back-end to retreive movie data, however, there are currently no available free APIs for this purpose. Only commercial APIs are availalble, however, unable to be used for this project due to lack of having a budget.



Steps to run application:

    git clone git@github.com:Isoxazole/where_can_i_watch_it.git
    cd where_can_i_watch_it
    bundle install
    rake db:migrate
    rails server

Notes:
The Cucumber tests use selenium-webdriver 2.42.2, which requires the use of firefox 38.0.5
Below are the commands to install firefox of this version:

    cd /home/user/Downloads

    wget sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_38.0.5-0ubuntu1_amd64.deb

    sudo dpkg -i firefox-mozilla-build_38.0.5-0ubuntu1_amd64.deb
