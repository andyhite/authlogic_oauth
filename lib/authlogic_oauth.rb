require File.dirname(__FILE__) + "/authlogic_oauth/version"
require File.dirname(__FILE__) + "/authlogic_oauth/oauth_process"
require File.dirname(__FILE__) + "/authlogic_oauth/acts_as_authentic"
require File.dirname(__FILE__) + "/authlogic_oauth/session"
require File.dirname(__FILE__) + "/authlogic_oauth/helper"
require File.dirname(__FILE__) + "/oauth_callback_filter"

ActiveRecord::Base.send(:include, AuthlogicOauth::ActsAsAuthentic)
Authlogic::Session::Base.send(:include, AuthlogicOauth::Session)
ActionController::Base.helper AuthlogicOauth::Helper

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