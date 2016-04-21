require 'rails_helper'

RSpec.describe 'Api::TasksController requests', type: :request do
  let(:user) { create :user }

  describe 'GET /api/trips' do
    let!(:trips) { create_list :trip, 10, user: user }
    let!(:non_user_trips) { create_list :trip, 3 }

    it 'returns 401 error if no current user' do
      get '/api/trips'
      expect(response.status).to eq(401)
    end

    it 'returns all current user trips' do
      sign_in(user)
      get '/api/trips'

      expect(response.status).to eq(200)
      json_trip_ids = json_response.map { |t| t['id'] }
      expect(json_trip_ids.count).to eq(10)
      expect(json_trip_ids).to eq(trips.map(&:id))
    end

    it 'filters trips by destination' do
      sign_in(user)
      trip = create :trip, user: user, destination: 'Test'
      get '/api/trips', destination: 'Test'

      expect(response.status).to eq(200)
      json_trip_ids = json_response.map { |t| t['id'] }
      expect(json_trip_ids.count).to eq(1)
      expect(json_trip_ids).to include(trip.id)
    end

    it 'filters trips by starts_after' do
      sign_in(user)
      trips.map { |t| t.update(start_date: 2.days.ago) }
      trip = create :trip, user: user, start_date: 2.day.since
      get '/api/trips', starts_after: 1.day.since

      expect(response.status).to eq(200)
      json_trip_ids = json_response.map { |t| t['id'] }
      expect(json_trip_ids.count).to eq(1)
      expect(json_trip_ids).to include(trip.id)
    end

    it 'filters trips by ends_before' do
      sign_in(user)
      trips.map { |t| t.update(end_date: 2.days.since) }
      trip = create :trip, user: user, end_date: 2.day.ago
      get '/api/trips', ends_before: 1.day.ago

      expect(response.status).to eq(200)
      json_trip_ids = json_response.map { |t| t['id'] }
      expect(json_trip_ids.count).to eq(1)
      expect(json_trip_ids).to include(trip.id)
    end

    it 'filters trips by selected_month' do
      sign_in(user)
      selected_month_trips = create_list :trip, 5, user: user, start_date: 2.month.since
      get '/api/trips', selected_month: 2.month.since

      expect(response.status).to eq(200)
      json_trip_ids = json_response.map { |t| t['id'] }
      expect(json_trip_ids.count).to eq(5)
      expect(json_trip_ids).to eq(selected_month_trips.map(&:id))
    end
  end

  describe 'DELETE /api/trips/:id' do
    let(:trip) { create :trip, user: user }
    let(:non_user_trip) { create :trip }

    it 'returns 401 error if no current user' do
      delete "/api/trips/#{trip.id}"
      expect(response.status).to eq(401)
    end

    it 'returns 404 error if current user is not owner' do
      sign_in(user)
      delete "/api/trips/#{non_user_trip.id}"
    end

    it 'updates trip' do
      trip
      expect do
        sign_in(user)
        delete "/api/trips/#{trip.id}"
        user.reload
      end.to change { user.trips.count }.by(-1)
    end
  end

  describe 'POST /api/trips' do
    let(:trip_params) { attributes_for :trip }

    it 'returns 401 error if no current user' do
      post '/api/trips', trip_params
      expect(response.status).to eq(401)
    end

    it 'creates trip' do
      expect do
        sign_in(user)
        post '/api/trips', trip_params
        user.reload
      end.to change { user.trips.count }
    end

    it 'does not creates trip without destination' do
      trip_params[:destination] = ''
      expect do
        sign_in(user)
        post '/api/trips', trip_params
        user.reload
      end.not_to change { user.trips.count }
      expect(json_response['destination']).to include("can't be blank")
    end

    it 'does not creates trip without start_date' do
      trip_params[:start_date] = ''
      expect do
        sign_in(user)
        post '/api/trips', trip_params
        user.reload
      end.not_to change { user.trips.count }
      expect(json_response['start_date']).to include("can't be blank")
    end

    it 'does not creates trip without end_date' do
      trip_params[:end_date] = ''
      expect do
        sign_in(user)
        post '/api/trips', trip_params
        user.reload
      end.not_to change { user.trips.count }
      expect(json_response['end_date']).to include("can't be blank")
    end

    it 'does not creates trip if start_date before end_date' do
      trip_params[:start_date], trip_params[:end_date] = trip_params[:end_date], trip_params[:start_date]
      expect do
        sign_in(user)
        post '/api/trips', trip_params
        user.reload
      end.not_to change { user.trips.count }
      expect(json_response['start_date']).to include(
        "must be greater than #{trip_params[:end_date].to_date}")
    end
  end

  describe 'PATCH /api/trips/:id' do
    let(:trip) { create :trip, user: user }
    let(:non_user_trip) { create :trip }
    let(:trip_params) { attributes_for :trip }

    it 'returns 401 error if no current user' do
      patch "/api/trips/#{trip.id}", trip_params
      expect(response.status).to eq(401)
    end

    it 'returns 404 error if current user is not owner' do
      sign_in(user)
      patch "/api/trips/#{non_user_trip.id}"
      expect(response.status).to eq(404)
    end

    it 'updates trip' do
      expect do
        sign_in(user)
        patch "/api/trips/#{trip.id}", trip_params
        trip.reload
      end.to change { trip.attributes }
    end
  end
end
