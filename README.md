# Install on Ubuntu (14.04)
Note: This has been tested on Ubuntu 14.04. Run following commands in a terminal..

Add PostgreSQL repos to Ubuntu's `apt`:<br>
for ubuntu 12.04
<pre>
sudo touch /etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee -a /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
</pre>
for ubuntu 14.04
<pre>
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list'
</pre>

Let's update apt sources:
<pre>sudo apt-get update</pre>

### Install OpenJDK-JRE, Redis and some nifty utilities
<pre>
sudo apt-get -y install python-software-properties screen zip unzip tmux sysvbanner make vim curl libpq-dev git openjdk-7-jre-headless redis-server
sudo apt-get -y install libcurl3-dev
</pre>

### Install Ruby and Rails

RVM 1.26.0 introduces signed releases and automated check of signatures when GPG software found.
Assuming you trust Michal Papis import the mpapis public key (downloading the signatures).
<pre>gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3</pre>
These can be compared with:
<pre>
https://rvm.io/mpapis.asc
https://keybase.io/mpapis
</pre>
Now install rvm, Ruby and Rails:
<pre>
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm use --install 2.3.0
rvm use 2.3.0
rvm alias create default 2.3.0
gem install rails
</pre>

### Install PostgreSQL and PostGIS
<pre>
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

gem install pg

sudo apt-get -y install postgresql-9.3 libpq-dev postgresql-contrib-9.3 postgresql-9.3-postgis-2.1

sudo pg_dropcluster --stop 9.3 main
sudo pg_createcluster --start -e UTF-8 9.3 main
</pre>

Switch to `postgres` user using:
<pre>
sudo su postgres
createuser --pwprompt --superuser su_inzap_rails
</pre>
Enter `root123` as password.
<pre>
createuser --pwprompt inzap_rails
</pre>
Enter `root123` as password again. Now exit the sudo environment:
<pre>
exit
</pre>

<pre>
sudo su postgres
psql
</pre>
Now `psql` prompt will open. Enter:
<pre>
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION postgis_tiger_geocoder;
</pre>
Now press `\q` to exit psql prompt. Now type `exit` and press enter to get out of sudo environment.

### Miscellaneous commands
<pre>
sudo service postgresql start
</pre>

### Clone todo-rails and setup project prerequisites
Now clone your todo-rails fork and then run:
<pre>
cd todo-rails
</pre>
Now run:
<pre>
bundle install
RAILS_ENV=development rake db:create
RAILS_ENV=test rake db:create
</pre>
Now run:
<pre>
RAILS_ENV=development rake db:migrate
RAILS_ENV=test rake db:migrate
</pre>
Now run:
<pre>
RAILS_ENV=development rake db:seed
RAILS_ENV=test rake db:seed
</pre>

# Troubleshoot

### Postgres
change to md5 - <a href="http://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge">http://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge</a>

### Rmagick
<pre>sudo apt-get install imagemagick libmagickwand-dev</pre>

# Other References

### Git
https://www.codeschool.com/courses/try-git<br>
https://www.codeschool.com/courses/git-real<br>

### Ruby
https://www.codeschool.com/courses/try-ruby<br>
https://www.codeschool.com/courses/ruby-bits<br>
https://www.codeschool.com/courses/ruby-bits-part-2<br>

### Rails
http://guides.rubyonrails.org/<br>
http://railscasts.com/<br>
http://www.codecademy.com/en/learn/make-a-rails-app/topics/ruby/exercises/ruby-welcome<br>
http://rails4.codeschool.com/videos<br>
https://www.coursera.org/course/webapplications<br>

### Postgresql
http://www.postgresql.org/docs/9.3/static/