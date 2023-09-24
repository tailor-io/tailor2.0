class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def create
    # Create a new experience record
    @experience = Experience.new(exp_params)

    if @experience.save

      experience_data = @experience
      title = experience_data["title"]
      id = experience_data.id
      puts "titleee and id"
      puts title, id
      description = experience_data.experience_descriptions.where(experience_id: id)
      puts description

    end
  end

  def add
    exp = Experience.new(exp_params)
    if exp.save
      # render json: { status: 'success', experience: exp }, status: :created
      puts exp.to_json
    else
      render json: { status: 'error', errors: exp.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delete
    exp = Experience.find(params[:id])
    exp.destroy
  end

  private

    def exp_params
      # params.require(:experience).permit(:title, descriptions_attributes: [:id, :content, :_destroy])
      # params.require(:experience).permit(:title, descriptions_attributes: [])
      params.require(:experience).permit(:title, descriptions_attributes: [])
    end
end