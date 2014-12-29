class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :destroy, :show,]
  
  respond_to :html

  def index
    @ideas = Idea.all

    #respond_with(@ideas)
  end 

  def show
    respond_with(@idea)

  end

  def new
    @idea = Idea.new
    respond_with(@idea)
  end

  def edit
    
  end

  def post
    logger.debug "4545545"
    logger.debug params.inspect
    @idea = Idea.find_by(id: params[:id])
    
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    @idea.save
    respond_with(@idea)
  end

  def update
    @idea.update(idea_params)
    respond_with(@idea)
  end

  def destroy
    @idea.destroy
    respond_with(@idea)
    # @like.destroy
    # flash[:success] = "Not Liked This Post"
  end

  def like
     idea = Idea.find(params[:id])

     if current_user.has_liked?(idea)
        like = Like.where(idea_id: idea.id, user_id: current_user.id).first
        like.destroy
        flash[:notice] = "You unliked this Post"
     else
        like = current_user.likes.new(idea_id: idea.id)
        if like.save
          flash[:notice] = "You Like this Post"
        else
          flash[:alert] = "Like not stored"
        end
     end
     redirect_to ideas_path
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
      @comments = @idea.comments.all
      @comment = @idea.comments.build
      
    end

    def idea_params
      params.require(:idea).permit(:description, :picture)
    end

   
end
