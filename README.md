Songlist
========

## Desarrollo

Dependencias: ruby, rake, npm, bower, phantomjs
```bash
su
curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.1.2
gem install rake
sudo apt-get install nodejs #ubuntu
     yum     install nodejs #fedora
npm install -g bower
npm install -g phantomjs
```

```bash
npm install
bower install
bundle install
```

## Servidor
`rails s`
`RAILS_ENV=production rails s`

## Tests
`RAILS_ENV=test bundle exec rake spec:javascript`
o...
`ir a /specs en el browser`


## Backlog
https://trello.com/b/bzhRTnJn/songlist

## Deploy
http://song-list.herokuapp.com/

```bash
#instalar heroku-toolbelt
heroku git:remote -a song-list
```
