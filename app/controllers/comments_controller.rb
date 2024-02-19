class CommentsController < ApplicationController
  #  ログインユーザーのみがコメントを投稿できるようにしたい場合  before_action :authenticate_user!, only: [:create]

  def create
    @comment = Comment.new(content_params)
  
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      redirect_to prototype_path(params[:prototype_id])
    end
  end  

  private
  def content_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
