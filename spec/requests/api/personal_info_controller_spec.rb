require 'rails_helper'

RSpec.describe 'Api::PersonalInfoController', type: :request do
  describe 'GET /api/personal_info/:id' do
    it 'returns a JSON response with the expected data' do
      # Create a sample PersonalInfo record for testing
      personal_info = PersonalInfo.create(
        first_name: 'John',
        last_name: 'Doe',
        city: 'New York',
        state: 'NY',
        phone: '123-456-7890'
      )

      # Make a GET request to the API endpoint
      get "/api/personal_info/#{personal_info.id}"

      # Expect a successful response (HTTP status code 200)
      expect(response).to have_http_status(200)

      # Parse the JSON response
      data = JSON.parse(response.body)

      # Perform assertions on the JSON data
      expect(data['first_name']).to eq('John')
      expect(data['last_name']).to eq('Doe')
      expect(data['city']).to eq('New York')
      expect(data['state']).to eq('NY')
      expect(data['phone']).to eq('123-456-7890')
    end
  end
end