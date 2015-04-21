source 'http://rubygems.org'
#ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
#devise gem
gem 'devise'
#devise authentication
gem 'omniauth'
gem "omniauth-google-oauth2"
gem "faraday", '~> 0.8.0'
#gem 'middleware'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
#?
gem 'spring',        group: :development
#calendar dashboard
gem 'fullcalendar-rails'
#gem 'momentjs-rails'
#bootstrap gems
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
#bootstrap datepicker
gem 'momentjs-rails', '>= 2.8.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.0.0'
#commented out since the actual js file is now in the javascripts folder.  Keeping here for reference
# helps the autocomplete and typeahead for forms
#gem 'twitter-typeahead-rails'
#gem 'handlebars', '~> 0.7.0'

#for pdf stuff
gem 'prawn'
gem 'prawnto'

gem 'high_voltage'
#that horrible mysql gem
gem 'mysql2'
gem 'simple_form'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platform=>:ruby
group :development do
  #helps follow ruby conventions
  gem 'better_errors'
  gem 'binding_of_caller', :platform=>:mri
  gem 'hub', :require=>nil
  gem 'rails_layout'
end
group :development, :test do
  gem 'rubocop'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]