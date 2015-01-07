require 'representable/json'

class UsersListRepresentation < Representable::Decorator
  include Representable::JSON

  property :id
  property :username
end
