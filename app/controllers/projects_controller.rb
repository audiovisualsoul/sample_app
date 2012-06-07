class ProjectsController < ApplicationController
 before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
    def index
    @title = "Projects"
    @projects = Project.paginate(:page => params[:page])
  end
  
    def show
    @project = Project.find(params[:id])
    @microposts = @project.microposts.paginate(:page => params[:page], :per_page => 5)
    @title = @project.name
     @micropost = Micropost.new if signed_in?
     @comment = Comment.new if signed_in?
  end
  
def create
@user = @current_user
  @project = Project.new(params[:project])
  @project.user = @user
  
    if @project.save
      flash[:success] = "New project created!"
      redirect_to @user
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
   def destroy
    @project.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @project = current_user.projects.find_by_id(params[:id])
      redirect_to root_path if @project.nil?
    end
end