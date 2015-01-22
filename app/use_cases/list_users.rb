class ListUsers
  include Anima.new(:user)

  def call
    representer.for_collection.represent(users)
  end

  private

  def representer
    if user
      BareUserRepresentation
    else
      UserRepresentation
    end
  end

  def users
    if user
      User.select(:id, :username).where.not(id: user.id).order(:username)
    else
      User.order(:username)
    end
  end
end
