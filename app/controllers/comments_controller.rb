class CommentsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
   def destroy
    @comment.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_path if @comment.nil?
    end
end