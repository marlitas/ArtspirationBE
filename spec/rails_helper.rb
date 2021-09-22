# This file is copied to spec/ when you run 'rails generate rspec:install'
require_relative './services/web_mock_stub'
require 'spec_helper'
require  'database_cleaner'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|

  config.before(:each) do
    # stub_request(:get, "localhost:3000/api/v1/users/:id/recommendations").to_return(status: 200, body: {
    #   'data': [
    #     {
    #     'id': '1',
    #     'type': 'artwork',
    #     'attributes': {
    #       'user_id': '1',
    #       'url': 'https://d32dm0rphc51dk.cloudfront.net/46PghnvIBjrN25-_kPPwQA/big_and_tall.jpg',
    #       'title': 'Campbells',
    #       'artist': 'Big Pharma',
    #       'artist_url': 'https://en.wikipedia.org/wiki/Vincent_van_Gogh',
    #       'liked': 'true'
    #     }
    #   },
    #     {'id': '2',
    #     'type': 'artwork',
    #     'attributes': {
    #       'user_id': '1',
    #       'url': 'https://d32dm0rphc51dk.cloudfront.net/46PghnvIBjrN25-_kPPwQA/big_and_tall.jpg',
    #       'title': 'Pharma',
    #       'artist': 'Big Campbell',
    #       'artist_url': 'https://en.wikipedia.org/wiki/Vincent_van_Dough',
    #       'liked': 'true'}}]}.to_json, headers: {} )

      # stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: WebmockStubs.mock_art, headers: {})
      #
      # stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").
      #    with(
      #      body: {"client_id"=>"3429ac42498f465efb3e", "client_secret"=>"7370bb88035545c70458ea97dd06a3c1"},
      #      headers: {
      #  	  'Accept'=>'*/*',
      #  	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #  	  'Content-Type'=>'application/x-www-form-urlencoded',
      #  	  'Host'=>'api.artsy.net',
      #  	  'User-Agent'=>'Ruby'
      #      }).
      #    to_return(status: 200, body: "", headers: {})
  end

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

   # add `FactoryBot` methods
  config.include FactoryBot::Syntax::Methods

  # start by truncating all the tables but then use the faster transaction strategy the rest of the time.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
