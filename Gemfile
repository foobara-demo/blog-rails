require_relative "version"

source "https://rubygems.org"
ruby FoobaraDemo::BlogRails::MINIMUM_RUBY_VERSION

# gem "foobara", path: "../../foobara/foobara"
# gem "foobara-http-command-connector", path: "../../foobara/http-command-connector"

gem "foobara-auth-http", "~> 0.0.1" # , path: "../../foobara/auth-http"
gem "foobara-dotenv-loader", "~> 0.0.1"
gem "foobara-local-files-crud-driver", "~> 0.0.1"
gem "foobara-rails-command-connector", "~> 0.0.1" # , path: "../rails-command-connector"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 2.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:windows, :jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "ostruct" # Only here to stop a warning caused by pry
  gem "pry"
  gem "pry-byebug"

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  # gem "rubocop-rails-omakase", require: false

  gem "rspec-rails", "~> 7"
end

group :development do
  gem "foob", "~> 0.0.1"
  gem "foobara-rubocop-rules", "~> 0.0.10"
  gem "guard-rspec"
  gem "rubocop-rake"
  gem "rubocop-rspec"
end

group :test do
  gem "foobara-spec-helpers", "~> 0.0.1"
  gem "rspec"
  gem "rspec-its"
  gem "ruby-prof"
  gem "simplecov"
  gem "vcr"
  gem "webmock"
end
