require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MovementsTrackerBack
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
        resource '*', headers: :any, methods: [:get, :post, :options, :delete, :put, :patch],
        credentials: true,
        expose: ['access-token', 'client', 'uid']
      end
    end
    
    config.action_controller.forgery_protection_origin_check = false
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    # config.middleware.delete ActionDispatch::Cookies
    # config.middleware.delete ActionDispatch::Session::CookieStore
    # Configuration for the application, engines, and railties goes here.
    # config.middleware.delete ActionDispatch::Cookies
    # config.middleware.delete ActionDispatch::Session::CookieStore
    # config.middleware.insert_after Rack::MethodOverride, ActionDispatch::Cookies
    # config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::CookieStore
    config.hosts << "localhost"
    config.default_host = "http://localhost:3001"
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
