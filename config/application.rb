require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flatchat
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join("app", "assets", "font")
    # -- all .rb files in that directory are automatically loaded.
  end
end
