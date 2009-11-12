get "/hello/?" do
  name = "Hello World"
  liquid :"hello/index", :locals => {'name' => name}
end
