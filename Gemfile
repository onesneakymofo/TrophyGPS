source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise_masquerade'
gem 'faker', github: 'stympy/faker'
gem 'font-awesome-rails'
gem 'haml-rails'
gem 'high_voltage'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'leaflet-rails', '~> 0.7.7'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'sprockets-es6', '~> 0.9.1'
gem 'turbolinks', '~> 5'
gem 'omniauth-facebook'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'rails', '~> 5.1.3'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
