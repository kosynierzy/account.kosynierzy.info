class ListUsers
  include Anima.new(:user_id)

  def call
    representer.for_collection.represent(users)
  end

  private

  def representer
    if user_id
      BareUserRepresentation
    else
      UserRepresentation
    end
  end

  def users
    if user_id
      User.select(:id, :username).where.not(id: user_id).order(:username)
    else
      User.order(:username)
    end
  end
end
