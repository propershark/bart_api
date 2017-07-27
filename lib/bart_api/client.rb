require 'memoist'

module Bart
  class Client < API
    extend Memoist

    require_all 'client', 'routes', 'stops'

    include_api :routes
    include_api :stops
  end
end

