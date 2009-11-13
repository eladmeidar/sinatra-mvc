get "/auth/test/?" do
  authorize!
  "You are authorized!"
end
