# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  config.load_paths += %W( #{RAILS_ROOT}/app/middlewares )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem "maruku"
  config.gem "jnunemaker-validatable", :version => "1.8.1", :lib => "validatable"
  config.gem "mongo_mapper", :version => "0.6.5", :source => "http://gemcutter.org"
  config.gem "compass", :version => "0.10.0.pre2", :lib => "compass", :source => "http://gemcutter.org"
  config.gem "fancy-buttons", :version => "0.3.7", :source => "http://gemcutter.org"
  config.gem "compass-colors", :version => "0.3.1", :source => "http://gemcutter.org"
  config.gem "ruby-stemmer", :version => ">=0.5.3", :lib => "lingua/stemmer"
  config.gem "mongomapper_ext", :version => "0.0.4", :source => "http://gemcutter.org"
  config.gem "geoip"
  config.gem "uuidtools", :version => "2.1.1"
  config.gem "haml", :version => "2.2.15"
  config.gem 'super_exception_notifier', :version => '~> 2.0.0', :lib => "exception_notifier"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  config.frameworks -= [ :active_record]
  config.action_mailer.delivery_method = :sendmail
  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.load_path += Dir[File.join(RAILS_ROOT, 'config', 'locales', '**', '*.{rb,yml}')]
  config.i18n.default_locale = :en

  # middlewares
  config.middleware.use "DynamicDomain", "shapado.com"
end

