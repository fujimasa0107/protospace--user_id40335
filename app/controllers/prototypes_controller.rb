class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  

  def index
    @user_name = current_user.name if user_signed_in?
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
    @user_name = current_user.name
  end

  def create
    Prototype.create(prototype_params)
    redirect_to '/'
  end

  def show
    @user_name = current_user.name if user_signed_in?
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])

    if prototype.update(prototype_params)
      redirect_to  prototype_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
