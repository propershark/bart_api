module Bart
  class Client::Stops < API
    extend Memoist

    # Return a list of all stops on the system.
    def list
      parsed = get_request '/api/stn.aspx', query: { cmd: :stns }
      parsed['root']['stations']['station'].map { |stop| Stop.new stop }
    end
    memoize :list
    alias_method :all, :list

    # Return the route whose id matches the given id
    def get id
      parsed = get_request '/api/stn.aspx', query: { cmd: :stninfo, orig: id }
      Stop.new parsed['root']['stations']['station']
    end
    memoize :get
    alias_method :find, :get
  end
end
