# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "rails", "~> 7.1.0"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "uglifier", ">= 1.3.0"
gem "webpacker", ">= 4.0.3"

gem "devise", ">= 4.7.0"
gem "devise-i18n", ">= 1.8.1"
gem "devise_token_auth", github: "lynndylanhurley/devise_token_auth"
gem "rack-cors", require: "rack/cors"
gem "rails-i18n", ">= 7.0.1"

gem "active_model_serializers", "~> 0.10.14"
gem "turbolinks", "~> 5"

group :development, :test do
  gem "pry-byebug"
  gem "pry-doc", ">= 1.1.0"
  gem "pry-rails"
  gem "rubocop-performance"
  gem "rubocop-rails", ">= 2.2.0"
  gem "rubocop-rspec"
end

group :development do
  gem "annotate", ">= 3.0.0"
  gem "capistrano", "~> 3.11", ">= 3.11.1", require: false
  gem "capistrano-bundler", "~> 2.0", ">= 2.0.0"
  gem "capistrano-database-yml", "~> 1.0.0"
  gem "capistrano-rails", "~> 1.5", ">= 1.5.0", require: false
  gem "capistrano-rbenv", "~> 2.1", ">= 2.1.5"
  gem "capistrano3-unicorn"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rails-erd", ">= 1.6.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 4.0.0"
end

group :test do
  gem "factory_bot_rails", ">= 5.1.0"
  gem "faker"
  gem "rspec-rails", ">= 3.8.3"
  gem "rspec_junit_formatter"
end

group :production do
  gem "mini_racer", platforms: :ruby
  gem "unicorn"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
