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
      let(:user) { create(:user, roles: roles) }
      let(:token) { double(acceptable?: true, resource_owner_id: user.id) }
      let(:roles) { %w{ something role } }

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
          expect(parsed_body.keys).to match_array(%w{id email username roles})
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

        it 'contains user roles' do
          expect(parsed_body['roles']).to match_array(roles)
        end
      end
    end
  end

  describe 'GET #index' do
    context 'when missing token' do
      it 'responds with 401' do
        get :index, format: :json

        expect(response.status).to eq(401)
      end
    end

    context 'when valid token' do
      let(:user) { create(:user, roles: roles) }
      let(:roles) { %w{ something role } }

      before do
        allow(controller).to receive(:doorkeeper_token).and_return(token)
      end

      context 'when request comes from application' do
        let(:token) { double(acceptable?: true, resource_owner_id: nil) }

        it 'responds with 200' do
          get :index, format: :json

          expect(response.status).to eq(200)
        end

        describe 'json body' do
          let(:parsed_body) { JSON.parse(response.body) }
          let(:expected_keys) do
            %w{id username email firstname lastname personal_identity_number identity_card_number phone_number roles address}
          end

          it 'looks like an array' do
            get :index, format: :json

            expect(parsed_body).to be_a(Array)
          end

          it 'contains all users' do
            create(:user)
            create(:user)

            get :index, format: :json

            expect(parsed_body.size).to eq(2)
          end

          it 'contains limited set of keys' do
            create(:user)

            get :index, format: :json

            expect(parsed_body.first.keys).to match_array(expected_keys)
          end
        end
      end

      context 'when request comes from user' do
        let(:token) { double(acceptable?: true, resource_owner_id: user.id) }
        let(:expected_keys) do
          %w{id username}
        end

        it 'responds with 200' do
          get :index, format: :json

          expect(response.status).to eq(200)
        end

        describe 'json body' do
          let(:parsed_body) { JSON.parse(response.body) }

          it 'looks like an array' do
            get :index, format: :json

            expect(parsed_body).to be_a(Array)
          end

          it 'contains all users except himself' do
            create(:user)

            get :index, format: :json

            expect(parsed_body.size).to eq(1)
            expect(parsed_body.first['id']).not_to eq(user.id)
          end

          it 'contains limited set of keys' do
            create(:user)

            get :index, format: :json

            expect(parsed_body.first.keys).to match_array(expected_keys)
          end
        end
      end
    end
  end
end
