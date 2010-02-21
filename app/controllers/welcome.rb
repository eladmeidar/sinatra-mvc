get '/' do
  "overwriting works"
end

get "/welcome/?" do
  @name = "Amazing!"
  erb :"welcome/index"
end

get "/hello.json" do
  content_type "text/plain"
  JSON.dump({:name => "Hello World"})
end

get "/member/?" do
  no_guest!
  "Oh dang! You just found the hidden egg! <a href='/logout'>logout</a>"
end

get "/hidden/?" do
  authenticate!
  redirect("/member/")
end

get "/logout/?" do
  bye!
  no_guest!
end