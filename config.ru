require 'app'

use Rack::ShowExceptions

puts $config
MVC.run! $config
