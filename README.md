Songlist
========

## Desarrollo

Dependencias: ruby, npm, heroku-toolbelt

```bash
npm install -g bower
npm install -g phantomjs
bundle
```

Correr servidor:
`rails server`

Correr tests:
`RAILS_ENV=test bundle exec rake spec:javascript`

(crear un alias `rjstest`)

## Backlog

https://trello.com/b/bzhRTnJn/songlist

## Deploy

http://song-list.herokuapp.com/

```
heroku git:remote -a song-list
```
