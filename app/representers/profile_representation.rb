require 'representable/json'

class ProfileRepresentation < Representable::Decorator
  include Representable::JSON

  property :id
  property :email
  property :username
  property :roles
end
