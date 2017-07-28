require 'memoist'

module Bart
  class Client < API
    extend Memoist

    require_all 'client', 'routes', 'stops', 'estimates'

    include_api :routes
    include_api :stops
    include_api :estimates
  end
end

