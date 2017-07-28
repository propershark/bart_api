module Bart
  class Stop < Model
    # Identity
    attribute :name
    attribute :abbr
    attribute :link

    # Location
    attribute :gtfs_latitude, type: Float
    alias_method :latitude, :gtfs_latitude
    attribute :gtfs_longitude, type: Float
    alias_method :longitude, :gtfs_longitude
    attribute :address
    attribute :city
    attribute :county
    attribute :state
    attribute :zipcode

    # Associations
    attribute :north_routes
    attribute :south_routes
    attribute :north_platforms
    attribute :south_platforms

    # Prose metadata
    attribute :platform_info
    attribute :intro
    attribute :cross_street
    attribute :food
    attribute :shopping
    attribute :attraction

    # Estimates from the `etd` endpoint
    attribute :etd, type: Bart::Destination, array: true
    alias_method :estimates, :etd

    primary_attribute :abbr
    alias_method :id, :abbr
  end
end
