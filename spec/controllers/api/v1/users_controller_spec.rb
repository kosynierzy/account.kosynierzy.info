require 'spec_helper'

describe Api::V1::UsersController do
  describe 'GET #me' do
    context 'when missing token' do
      it 'responds with 401' do
        get :me, format: :json

        expect(response.status).to eq(401)
      end
    end

    context 'when valid token' do
      let(:user) { create(:user) }
      let(:token) { double(accessible?: true, resource_owner_id: user.id) }

      before do
        controller.stub(doorkeeper_token: token)
      end

      it 'responds with 200' do
        get :me, format: :json

        expect(response.status).to eq(200)
      end

      it 'returns the user as json' do
        get :me, format: :json

        expect(response.body).to eq(user.to_json)
      end
    end
  end
end
