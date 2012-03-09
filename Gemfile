source 'https://rubygems.org'

gem 'rails', '3.2.2'

group :assets do
  gem 'sass-rails',     '~> 3.2.3'
  gem 'coffee-rails',   '~> 3.2.1'
  gem 'uglifier',       '>= 1.0.3'
end
gem 'anjlab-bootstrap-rails', '>= 2.0', :require => 'bootstrap-rails'

gem 'thin'
gem 'jquery-rails'
gem 'haml-rails'
gem 'twitter'
gem 'json'
gem 'twitter-bootstrap-rails'

group :development do
  gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
  gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  gem 'ruby-debug19'

  gem 'hirb'
  gem 'wirble'
  gem 'awesome_print'
end

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'

  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
  gem 'pg'
end
