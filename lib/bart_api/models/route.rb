module Bart
  class Route < Model
    attribute :name
    attribute :abbr
    attribute :route_id
    attribute :number, type: Integer
    alias_method :id, :number
    attribute :hexcolor
    attribute :color

    attribute :origin
    attribute :destination
    attribute :holidays
    attribute :num_stns
    attribute :direction
    
    attribute :config

    primary_attribute :id
  end
end
