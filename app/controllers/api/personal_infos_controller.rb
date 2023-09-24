module Api
  class PersonalInfoController < ApplicationController
    def index
      # Retrieve the personal information you need
      personal_info = PersonalInfo.find(params[:id])

      # Respond with JSON data
      render json: personal_info.as_json(only: [:first_name, :last_name, :city, :state, :phone])
    end
  end
end
