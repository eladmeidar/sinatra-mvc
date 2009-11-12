Sequel::Model.plugin(:schema)
Sequel.connect("sqlite://db/development.db")
class Hello < Sequel::Model
  set_schema do
    primary_key :id
    String :helloworld
  end
  create_table unless table_exists?
end

