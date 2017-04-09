source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'

# Use ActiveModelSerializers. See: https://github.com/rails-api/active_model_serializers
gem 'active_model_serializers'

# Net::LDAP for Ruby. See: https://github.com/ruby-ldap/ruby-net-ldap
gem 'net-ldap'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Foreman. See: https://github.com/ddollar/foreman
gem 'foreman', '~> 0.84.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
#gem 'bcrypt', '~> 3.1.11'

gem 'jwt'

# Pagination. See: https://github.com/kaminari/kaminari
gem 'kaminari'

# Letter Avatar. See: https://github.com/ksz2k/letter_avatar
gem 'letter_avatar'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'

  # Coverage. See: https://github.com/colszowka/simplecov
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
