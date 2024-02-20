class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @profile = @user.profile
    @occupation = @user.occupation
    @position = @user.position
    @prototype = @user.prototypes
  end

private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
