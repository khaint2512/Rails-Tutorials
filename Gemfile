source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "config"
gem "rails", "5.1.6"
gem "bcrypt", "3.1.12"
gem "faker", "1.7.3"
gem "ffaker"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "3.3.7"
gem "i18n-js"
gem "sqlite3"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"

group :development, :test do
  gem "byebug", platform: :mri
  gem "mysql2", ">= 0.4.4", " <0.6.0"
  gem "listen", "~> 3.1", ">= 3.1.5"
end

group :development do
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
