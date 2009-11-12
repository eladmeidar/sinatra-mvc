Sinatra based MVC app
====================

git clone git@github.com:bry4n/sinatra-mvc.git

1) `cd sinatra-mvc`

2) `ruby app.rb`

3) go to http://localhost:8080/


### shotgun

1) sudo gem install shotgun

2) `shotgun -O --server=thin --port=8080`

### unicorn

1) sudo gem install unicorn

2) `unicorn`

### rack

- Thin

1) rackup -s thin -p 8080

- Mongrel

2) rackup -s mongrel -p 8080
