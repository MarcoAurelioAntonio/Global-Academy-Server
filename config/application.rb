require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module AppointmentServer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.action_controller.asset_host = 'http://localhost:3000'
    
    middleware.use Rack::Cors do
      allow do
        origins '*' # Update this with the appropriate origin(s) that should be allowed
        resource '*', headers: :any, methods: [:get, :post,:delete, :options]
      end
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
