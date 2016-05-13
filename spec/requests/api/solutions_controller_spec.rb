require 'rails_helper'

RSpec.describe Api::SolutionsController do
  let(:user) { create :user }

  describe 'GET /api/solutions' do
    let!(:solutions) { create_list :solution, 10, user: user }
    let!(:non_user_solutions) { create_list :solution, 3 }

    it 'returns 401 error if no current user' do
      get '/api/solutions'
      expect(response.status).to eq(401)
    end

    it 'returns all current user solutions' do
      sign_in(user)

      get '/api/solutions'
      expect(response.status).to eq(200)
      json_solution_ids = json_response.map { |t| t['id'] }
      expect(json_solution_ids.count).to eq(10)
      expect(json_solution_ids).to eq(solutions.map(&:id))
    end
  end

  describe 'POST /api/solutions' do
    let(:solution_params) { attributes_for :solution }

    it 'returns 401 error if no current user' do
      post '/api/solutions', solution_params
      expect(response.status).to eq(401)
    end

    it 'creates solution' do
      expect do
        sign_in(user)
        post '/api/solutions', solution_params
        user.reload
      end.to change { user.solutions.count }
      expect(user.solutions.last.state).to eq('started')
    end

    it 'runs VrpWorker' do
      expect do
        sign_in(user)
        post '/api/solutions', solution_params
        user.reload
      end.to change { VrpWorker.jobs.count }.by(1)
    end

    it 'does not creates solution without date' do
      solution_params[:date] = ''
      expect do
        sign_in(user)
        post '/api/solutions', solution_params
        user.reload
      end.not_to change { user.solutions.count }
      expect(json_response['date']).to include("can't be blank")
    end
  end
end
