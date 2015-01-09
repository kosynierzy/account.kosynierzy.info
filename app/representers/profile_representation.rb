require 'representable/json'

class ProfileRepresentation < Representable::Decorator
  include Representable::JSON

  property :id
  property :email
  property :username
  property :roles
  property :firstname
  property :lastname
  property :personal_identity_number
  property :identity_card_number
  property :phone_number
  property :address
end
