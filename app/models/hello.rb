Sequel::Model.plugin(:schema)

class Hello < Sequel::Model
  set_schema do
    primary_key :id
    String :helloworld
  end
  create_table unless table_exists?
end

