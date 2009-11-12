namespace :db do
  desc "Drop all tables"
  task :drop => :init do
    DB.tables.each {|table| DB.drop_table(table)}
  end
  task :init do
    unless Object.const_defined?('Sequel')
     require "sequel"
     DB = Sequel.connect("sqlite://db/development.db")
    end
  end
end
