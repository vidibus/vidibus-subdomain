module Vidibus
  module Subdomain
    module Extensions
      module Controller
        extend ActiveSupport::Concern

        included do
          helper_method :realm
        end

        # Ensures that subdomain is present
        def ensure_subdomain!
          subdomain or render(:text => "Subdomain required!", :status => :unauthorized)
        end

        # Returns current subdomain.
        def subdomain
          @subdomain ||= begin
            request.host_with_port.match(/(.+)\.#{::Service.this.domain}/)
            if $1
              s = OpenStruct.new
              s.realm = $1
              s
            end
          end
        end

        # Returns realm from subdomain. Currently, it is the subdomain itself.
        def realm
          subdomain.realm
        end
      end
    end
  end
end
