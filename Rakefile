require 'spec/rake/spectask'

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
    %w{ sinatra rspec rack-test }.each {|gem| system "sudo gem install #{gem}" }
  end
end
