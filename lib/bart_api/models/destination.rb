module Bart
  class Destination < Model
    attribute :destination
    alias_method :name, :destination
    attribute :abbreviation
    alias_method :abbr, :abbreviation

    attribute :limited, type: Integer
    attribute :estimate, type: Bart::Arrival, array: true
    alias_method :arrivals, :estimate

    primary_attribute :abbr
  end
end

