An Agile Sinatra-based MVC app
====================

Want an agile MVC structured app in Sinatra? 


git clone git@github.com:bry4n/sinatra-mvc.git firstapp

1) `cd firstapp`

2) `ruby app.rb`

3) go to http://localhost:8080/

---

Create your own controllers, models, views in `app/` directory

- Controllers: `app/controllers`

- Models: `app/models`

- Views: `app/views`

To point the `/` to controller, edit `configs/routes.rb`

Library dependencies as Template engines, Databases, etc.., edit `configs/deps.rb`


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
