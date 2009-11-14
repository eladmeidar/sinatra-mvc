require 'spec/rake/spectask'
require 'yaml'

begin
 require "launchy"
rescue
end

task :default => :test
task :test => :spec

if !defined?(Spec)
  puts "rspec is required! - rake gems:install"
else
 desc "do the test first"
 Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = ['-cfs']
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
    config = YAML.load_file("configs/config.yml")
    app = Thread.new { system "ruby app.rb" }
    web = Thread.new { sleep(1); Launchy.open("http://#{config["host"]}:#{config["port"]}/") }
    app.join
    web.join
  end
  desc "Start app"
  task :run do
    system "ruby app.rb"
  end
end
