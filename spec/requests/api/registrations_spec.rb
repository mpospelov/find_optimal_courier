require 'rails_helper'

RSpec.describe 'Api Registrations' do
  describe 'POST /api/registrations' do
    let(:params) { attributes_for(:user) }

    it 'creates user' do
      expect do
        post '/api/registration', params
      end.to change { User.count }.by(1)
    end

    it 'does not creates user if email already exists' do
      create :user, email: params[:email]
      expect do
        post '/api/registration', params
      end.not_to change { User.count }
      expect(json_response['email']).to include('has already been taken')
    end

    it 'does not creates user if password is short' do
      params[:password] = '123'
      expect do
        post '/api/registration', params
      end.not_to change { User.count }
      expect(json_response['password']).to include('is too short (minimum is 6 characters)')
    end

    it 'does not creates user if password is long' do
      params[:password] = '1234567890' * 3
      expect do
        post '/api/registration', params
      end.not_to change { User.count }
      expect(json_response['password']).to include('is too long (maximum is 20 characters)')
    end
  end
end
