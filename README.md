An Agile Sinatra-based MVC app
====================

Want an agile MVC structured app in Sinatra? 

 - Demo [http://sinatra-mvc.heroku.com/](http://sinatra-mvc.heroku.com/)

## Prerequisites

- [sinatra](http://www.sinatra.com/) (sudo gem install sinatra)


## Instructions

`git clone git@github.com:bry4n/sinatra-mvc.git firstapp`

1) `cd firstapp`

2) rake gems:install

3) rake app:launch  # Start app and Launch browser

or

3) rake app:run # Start app without browser
4) go to http://localhost:8080/

---

Create your own controllers, models, views in `app/` directory

- Controllers: `app/controllers`

- Models: `app/models`

- Views: `app/views`

To point the `/` to a particular controller, edit `configs/routes.rb`

Library dependencies as Template engines, Databases, etc.., edit `configs/deps.rb`

Serve static files (jquery, css, images, downloads), place static files in `public/`

Write your own extensions (helpers) in `helpers/`

Test your app in interactive shell, type: `script/console`

---

### To Do

- RESTful API emitters (JSON, XML, YAML, etc..)

- script/generate like rails (creating controllers (full CRUD), models, views automatically)

- gem package

---

### shotgun

1) sudo gem install shotgun

2) `shotgun -O`


### unicorn

1) sudo gem install unicorn

2) `unicorn -C configs/unicorn.rb`


### rack

- Thin

1) rackup -s thin -p 8080

- Mongrel

2) rackup -s mongrel -p 8080
