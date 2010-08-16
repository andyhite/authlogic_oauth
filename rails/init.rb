require "authlogic_oauth"
require "oauth_callback_filter"

# Throw callback rack app into the middleware stack
if defined?(ActionController::Metal)
  module AuthlogicOauth
    class Railtie < Rails::Railtie
      initializer :load_oauth_callback_filter do |app|
        app.config.middleware.use(OauthCallbackFilter) # Rails >= 3.0
      end
    end
  end
else
  ActionController::Dispatcher.middleware.use(OauthCallbackFilter) # Rails < 3.0
end