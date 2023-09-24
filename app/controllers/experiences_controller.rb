class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def add
    exp = Experience.new(exp_params)
    exp.save
    redirect_to '/experiences'
  end

  def delete
    exp = Experience.find(params[:id])
    exp.destroy
    redirect_to '/experiences'
  end

  private

    def exp_params
      params.permit(:description)
    end
end
