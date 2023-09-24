require 'uri'
require 'net/http'
class PersonalInfosController < ApplicationController

  @personal_info = PersonalInfo.last
  def new
    @personal_info = PersonalInfo.new
  end

  def create
    user_id = SecureRandom.uuid
    @personal_info = PersonalInfo.new(personal_info_params)
    @personal_info.user_id = user_id

    if @personal_info.save
      uri = URI("https://tailor-mongo-back-end-c176f21f8caf.herokuapp.com/user/create")

      # Create a Net::HTTP object and configure it
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true # Use SSL for secure communication if needed

      # Create the HTTP request
      request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
      request.body = @personal_info.to_json

      # Send the request and get the response
      response = http.request(request)

      # Check response
      if response.code == '200'
        puts "success"
      else
        puts "failure"
      end
    else
      # Failed to save the PersonalInfo record, return errors
      render json: { success: false, errors: @personal_info.errors.full_messages }
    end
  end


  private
  def personal_info_params
    params.require(:personal_info).permit(:user_id, :first_name, :last_name, :city, :state, :phone)
  end
end
