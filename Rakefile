require 'rspec/core/rake_task'
require 'yaml'

begin
 require "launchy"
rescue
  module Launchy
    class << self
      def open(url)
        system "open #{url}"
      end
    end
  end
end

task :default => :test
task :test => :spec

if !defined?(RSpec)
  puts "rspec is required! - rake gems:install"
else
 desc "do the test first"
  RSpec::Core::RakeTask.new('spec') do |t|
   t.pattern = 'spec/**/*.rb'
   t.rspec_opts = ['--backtrace']
 end
end

namespace :gems do
  desc "install gems"
  task :install do
    %w{ sinatra rspec rack-test launchy }.each {|gem| system "sudo gem install #{gem}" }
  end
end

namespace :app do
  desc "Start app and launch browser"
  task :launch do
    if defined?("Launchy")
    config = YAML.load_file("configs/config.yml")
    app = Thread.new { system "ruby app.rb" }
    web = Thread.new { sleep(1); Launchy.open("http://#{config["host"]}:#{config["port"]}/") }
    app.join
    web.join
    else
      puts "please install launchy or run rake gems:install"
    end
  end
  desc "Start app"
  task :run do
    system "ruby app.rb"
  end
end
