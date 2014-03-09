require 'representable/json'

class ProfileRepresentation < Representable::Decorator
  include Representable::JSON

  property :id
  property :email
end
