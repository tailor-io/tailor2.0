class PersonalInfosController < ApplicationController

  def new
    @personal_info = PersonalInfo.new
  end

  def create
    @personal_info = PersonalInfo.new(personal_info_params)

    if @personal_info.save
      redirect_to @personal_info, notice: 'Personal info was successfully created.'
    else
      render :new
    end
  end

  private
  def personal_info_params
    params.require(:personal_info).permit(:user_id, :first_name, :last_name, :city, :state, :phone_number)
  end
end
