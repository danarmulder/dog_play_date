class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] =@user.id
      redirect_to new_dog_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name,
                                :email,
                                :password,
                                :password_confirmation,
                                :age,
                                :zipcode,
                                :gender,
                                :bio)
  end
end
