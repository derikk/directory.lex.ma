source "https://rubygems.org"

ruby "3.0.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 7.0.0"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6"

# Use postgre as the database for Active Record in production
gem "pg", group: :production

# Use Sass to process CSS
gem "sassc-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"


group :development, :test do
  # Use sqlite3 as the database for Active Record in development
  gem "sqlite3", "~> 1.4"

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console"
end

