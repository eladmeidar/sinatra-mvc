get "/welcome/?" do
  @name = "Amazing!"
  erb :"welcome/index"
end

get "/hello.json" do
  content_type "text/plain"
  JSON.dump({:name => "Hello World"})
end
