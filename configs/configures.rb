configure :development do
 Sequel.connect("sqlite://db/development.db")
end

configure :production do
 Sequel.connect("sqlite://db/production.db")
end

configure :test do
 Sequel.connect("sqlite://db/test.db")
end
