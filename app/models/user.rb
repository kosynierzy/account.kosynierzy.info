class User < ActiveRecord::Base
  devise :confirmable,
         :database_authenticatable,
         :lockable,
         :recoverable,
         :registerable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable
end
