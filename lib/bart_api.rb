require_relative 'bart_api/core_ext/string'
require_relative 'bart_api/core_ext/hash'
require_relative 'bart_api/core_ext/float'
require_relative 'bart_api/core_ext/integer'

require_relative 'bart_api/version'
require_relative 'bart_api/configuration'
require_relative 'bart_api/connection'
require_relative 'bart_api/models'
require_relative 'bart_api/api'
require_relative 'bart_api/client'

module Bart
  class << self
    # Alias for `Bart::Client.new`
    def new
      Client.new
    end

    # The current client configuration
    def configuration
      @configuration ||= Configuration.new
    end

    # Allow users to set configuration options via a block. By default, the
    # configuration will be validated after the block returns. This will raise
    # an exception if any required configurations are not provided. This
    # behavior can be skipped by passing `validate: false` as a parameter.
    def configure validate: true
      yield configuration
      configuration.validate! if validate
      configuration
    end
  end
end
