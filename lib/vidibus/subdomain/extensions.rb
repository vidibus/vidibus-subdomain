require "subdomain/extensions/controller"

ActiveSupport.on_load(:action_controller) do
  include Vidibus::Subdomain::Extensions::Controller
end
