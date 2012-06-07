class CommentsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
def create
  @micropost = Micropost.find(params[:micropost_id])
  @project = @micropost.project
  @comment = Comment.new(params[:comment])
  @comment.micropost = @micropost
  @commentUser = current_user
	
if @comment.save
      #flash[:success] = "comment created!"
      redirect_to @micropost.project
    else
      @feed_items = []
      render @project
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