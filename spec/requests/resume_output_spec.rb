require 'rails_helper'

RSpec.describe "ResumeOutputs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/resume_output/index"
      expect(response).to have_http_status(:success)
    end
  end

end
