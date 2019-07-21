Where Can I Watch It?

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
