class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
def create
 @project = Project.find(params[:project_id])
  @micropost = Micropost.new(params[:micropost])
  @micropost.project = @project
  @micropost.user = @project.user
	
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to @project
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
   def destroy
    @micropost.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @micropost = @project.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end