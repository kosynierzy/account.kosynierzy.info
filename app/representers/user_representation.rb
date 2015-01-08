require 'representable/json'

class UserRepresentation < Representable::Decorator
  include Representable::JSON

  property :id
  property :username
  property :email
  property :roles
  property :firstname
  property :lastname
  property :personal_identity_number
  property :identity_card_number
  property :phone_number
  property :address
end
