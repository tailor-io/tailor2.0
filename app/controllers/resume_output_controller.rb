require 'uri'
require 'net/http'

class ResumeOutputController < ApplicationController
  def index

  end

  def submit_url
    @resume = Resume.new
    HARDurl = "https://boards.greenhouse.io/adept/jobs/4265377006"

    user_id = "650f3a5e13ee8d6494714010"
    if @resume.save
      uri = URI("https://tailor-job-scraper-7e4b7f88930e.herokuapp.com/scrape?url=#{CGI.escape(HARDurl)}&user-id=650f3a5e13ee8d6494714010")

      # Create a Net::HTTP object and configure it
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true # Use SSL for secure communication if needed

      # Create the HTTP request
      request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')

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
  def resume_output_params
    params.require(:resume_output).permit(:company_url)
  end
end


