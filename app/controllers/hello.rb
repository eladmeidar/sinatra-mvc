get "/hello/?" do
  name = "Hello World"
  liquid :"hello/index", :locals => {'name' => name}
end

get "/hello.json" do
  content_type "text/plain"
  JSON.dump({:name => "Hello World"})
end
