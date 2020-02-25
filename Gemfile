source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
# gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'

# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Added by Cahyadi Triyansyah

group :development, :test, :staging do
  gem 'annotate', '~> 3.1'
  gem 'awesome_print', '~> 1.8'
  gem 'database_cleaner', '~> 1.8'
  gem 'factory_bot_rails', '~> 5.1'
  gem 'faker', '~> 2.10'
  gem 'rspec-rails', '~> 3.9'
  gem 'sdoc', '~> 1.0'
  gem 'shoulda-matchers', '~> 4.3'
end

gem 'active_model_serializers', '~> 0.10'
gem 'api-pagination', '~> 4.8'
gem 'httparty', '~> 0.18'
gem 'jwt', '~> 2.2'
gem 'kaminari', '~> 1.2'
gem 'oj', '~> 3.10'
gem 'validates_email_format_of', '~> 1.6'
