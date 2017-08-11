module Bart
  class Arrival < Model
    attribute :minutes
    attribute :platform, type: Integer
    attribute :direction
    attribute :length, type: Integer
    alias_method :train_length, :length
    attribute :color
    attribute :hexcolor
    attribute :bikeflag, type: Integer
  end
end
