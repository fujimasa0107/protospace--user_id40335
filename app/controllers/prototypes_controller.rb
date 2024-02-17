class PrototypesController < ApplicationController
  def index
    @user_name = current_user.name if user_signed_in?
  end

end
