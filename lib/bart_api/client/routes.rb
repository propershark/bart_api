module Bart
  class Client::Routes < API
    extend Memoist

    # Return a list of all routes on the system.
    def list
      parsed = get_request '/api/route.aspx', query: { cmd: :routes }
      parsed['root']['routes']['route'].map { |route| Route.new route }
    end
    memoize :list
    alias_method :all, :list

    # Return the route whose id matches the given id
    def get id
      parsed = get_request '/api/route.aspx', query: { cmd: :routeinfo, route: id }
      Route.new parsed['root']['routes']['route']
    end
    memoize :get
    alias_method :find, :get
  end
end
