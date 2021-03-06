class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:prototype_images, :tags).page(params[:page])
  end
  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless @user.id == current_user.id
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :team, :profile, :work, :avator)
  end
end
