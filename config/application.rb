require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Talkapp
  class Application < Rails::Application
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
  end
end