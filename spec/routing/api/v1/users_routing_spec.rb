require 'spec_helper'

describe '/api/v1/me path' do
  it 'routes to api users controller' do
    expect({ get: '/api/v1/me.json' }).to route_to(
      controller: 'api/v1/users',
      action: 'me',
      format: 'json'
    )
  end
end

describe '/api/v1/users path' do
  it 'routes to api users controller' do
    expect({ get: '/api/v1/users.json' }).to route_to(
      controller: 'api/v1/users',
      action: 'index',
      format: 'json'
    )
  end
end
