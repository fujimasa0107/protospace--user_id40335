class PrototypesController < ApplicationController
  def index
    @user_name = current_user.name if user_signed_in?
  end


  private

  def prototype_params
    params.require(:prototype).permit(:content, :image).merge(user_id: current_user.id)
  end

end
