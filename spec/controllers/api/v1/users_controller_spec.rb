require 'spec_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #me' do
    context 'when missing token' do
      it 'responds with 401' do
        get :me, format: :json

        expect(response.status).to eq(401)
      end
    end

    context 'when valid token' do
      let(:user) { create(:user) }
      let(:token) { double(acceptable?: true, resource_owner_id: user.id) }

      before do
        allow(controller).to receive(:doorkeeper_token).and_return(token)
      end

      it 'responds with 200' do
        get :me, format: :json

        expect(response.status).to eq(200)
      end

      describe 'json body' do
        let(:parsed_body) { JSON.parse(response.body) }

        before do
          get :me, format: :json
        end

        it 'contains limited set of keys' do
          expect(parsed_body.keys).to match_array(%w{id email username})
        end

        it 'contains user email' do
          expect(parsed_body['email']).to eq(user.email)
        end

        it 'contains user id' do
          expect(parsed_body['id']).to eq(user.id)
        end

        it 'contains user username' do
          expect(parsed_body['username']).to eq(user.username)
        end
      end
    end
  end
end
