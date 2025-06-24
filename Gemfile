# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "rails", "~> 7.0.0"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

gem "devise"
gem "devise-i18n"
gem "devise_token_auth", github: "lynndylanhurley/devise_token_auth"
gem "rack-cors", require: "rack/cors"
gem "rails-i18n"

gem "active_model_serializers", "~> 0.10.0"
gem "turbolinks", "~> 5"

group :development, :test do
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "annotate"
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-bundler", "~> 1.5"
  gem "capistrano-database-yml", "~> 1.0.0"
  gem "capistrano-rails", "~> 1.4", require: false
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano3-unicorn"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rails-erd"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
end

group :production do
  gem "mini_racer", platforms: :ruby
  gem "unicorn"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
