module Bart
  class Configuration
    # The version of the BART system
    attr_accessor :version
    # The base URL of the BART system
    attr_accessor :base_uri
    # The adapter to use for network communication
    attr_accessor :adapter
    # The output stream to which debug information should be written
    attr_accessor :debug_output
    # The key used to make requests, defaulting to BART's public key.
    attr_accessor :api_key
    # The number of seconds real-time results are cached for.
    attr_accessor :refresh_time

    # The defaults to use for any configuration options that are not provided
    DEFAULT_CONFIGURATION = {
      adapter: :httparty,
      debug_output: false,
      base_uri: 'http://api.bart.gov',
      refresh_time: 30,
      api_key: 'MW9S-E7SL-26DU-VV8V'
    }

    # The options required when configuring a BART instance
    REQUIRED_CONFIGURATION = [
      :base_uri,
      :api_key,
      :refresh_time
    ]

    def initialize
      # Apply the default set of configurations before anything else to ensure
      # all options are initialized.
      DEFAULT_CONFIGURATION.each do |name, value|
        send("#{name}=", value)
      end
    end

    # Ensure that all required configurations have been given a value. Returns
    # true if all required configuration options have been set.
    def validate!
      REQUIRED_CONFIGURATION.each do |name|
        raise "`#{name}` is a required configuration option, but was not given a value." if send("#{name}").nil?
      end
      true
    end
  end
end
