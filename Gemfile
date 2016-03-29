source 'https://rubygems.org'


gem 'rails', '4.2.6'

gem 'rails-api'

gem 'rails_12factor', group: [:production]

gem 'spring', :group => :development

gem 'pg'



# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'rollbar'
gem 'oj', '~> 2.12.14'
# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'annotate'
  gem 'simplecov', require: false

  gem 'rubocop', require: false
end
