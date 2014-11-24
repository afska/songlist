Songlist
========

## Enviroment

```
App dependencies: ruby, bower
Test dependencies: phantomjs
```

```bash
#install rvm:
curl -sSL https://get.rvm.io | bash -s stable
su -c "usermod -a -G rvm $USER"
source /etc/profile.d/rvm.sh >> ~/.bashrc

#install ruby by rvm:
rvm install 2.1.2

#install nodejs:
sudo apt-get install nodejs #or...
     yum     install nodejs

#install npm:
curl http://npmjs.org/install.sh | sh

#install bower by npm:
npm install -g bower
```

## Install
```bash
bower install
bundle install
bundle exec rake db:mongoid:create_indexes
```

## Server
```bash
rails s #dev
rvmsudo RAILS_ENV=production rails s -p 80 #production
```

## Tests
```bash
RAILS_ENV=test bundle exec rake spec:javascript
#or go to /specs in the browser...
```

## Backlog
https://trello.com/b/bzhRTnJn/songlist

## Deploy
http://song-list.herokuapp.com/

```bash
#install heroku-toolbelt
heroku git:remote -a song-list
```