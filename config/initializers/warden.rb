Warden::Manager.after_set_user(except: :fetch) do |user, auth, opts|
  Session.where(id: auth.raw_session['sso_id']).destroy_all

  session = Session.create!(user: user)

  auth.raw_session['sso_id'] = session.id
end

Warden::Manager.after_fetch do |user, auth, opts|
  session = Session.find_by(id: auth.raw_session['sso_id'])

  if session.try(:alive?)
    session.save!
  else
    auth.logout

    throw :warden, message: :unauthenticated
  end
end

Warden::Manager.before_logout do |user, auth, opts|
  Session.where(id: auth.raw_session['sso_id']).destroy_all
end
