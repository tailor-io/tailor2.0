class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def add
    exp = Experience.new(exp_params)
    exp.save
    # redirect_to '/experiences'
  end

  def delete
    exp = Experience.find(params[:id])
    exp.destroy
    # redirect_to '/experiences'
  end

  private

    def exp_params
      params.require(:experience).permit(:title, descriptions_attributes: [:id, :content, :_destroy])
    end
end
