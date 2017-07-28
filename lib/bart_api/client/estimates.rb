module Bart
  class Client::Estimates < API
    RESOLUTION = 30 # seconds

    def key stop_id, platform, direction
      [stop_id, platform, direction]
    end

    # We need to memoize but never for longer than `RESOLUTION`, so rather than
    # use Memoist this API maintains its own memo.
    def get stop_id, platform: nil, direction: nil
      @memo ||= {}
      model, stored_at = @memo[[stop_id, platform, direction]]
      return model if stored_at && Time.now - RESOLUTION < stored_at

      parsed = get_request '/api/etd.aspx', query: { 
        cmd: :etd, 
        orig: stop_id,
        plat: platform,
        dir: direction
      }.select { |_,v| v != nil }

      model = Stop.new parsed['root']['station']
      @memo[[stop_id, platform, direction]] = [model, Time.now]
      model
    end
    alias_method :find, :get

  end
end
