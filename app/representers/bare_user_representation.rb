require 'representable/json'

class BareUserRepresentation < Representable::Decorator
  include Representable::JSON

  property :id
  property :username
end
