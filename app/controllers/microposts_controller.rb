class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  
def create
 @project = Project.find(params[:project_id])
  @micropost = Micropost.new(params[:micropost])
  @micropost.project = @project
  @micropost.user = @project.user

    if @micropost.save
      #flash[:success] = "Track created!"
      redirect_to @project
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
  def show
      @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.paginate(:page => params[:page], :per_page => 10)
    @title = @micropost.content
     @comment = Comment.new if signed_in?
  end
  
   def destroy
    @micropost.destroy
    redirect_to @micropost.project
  end

  private

    def authorized_user
    	@user = current_user
      @micropost = @user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end