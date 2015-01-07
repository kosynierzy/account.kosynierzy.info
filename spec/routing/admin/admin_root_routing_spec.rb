require 'spec_helper'

describe '/admin path' do
  it 'routes to admin users controller index action' do
    expect({ get: '/admin' }).to route_to(
      controller: 'admin/users',
      action: 'index'
    )
  end
end
