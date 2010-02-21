get "/" do
 redirect "/welcome/"
end

not_found do
  status 404
  "We don't know thee #{request.path_info}"
end
