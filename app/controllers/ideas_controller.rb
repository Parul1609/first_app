class IdeasController < ApplicationController
  before_action :set_idea, only: [:edit, :update, :destroy]
  
  respond_to :html

  def index
    @ideas = Idea.all
    respond_with(@ideas)
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
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
      @comments = @idea.comments.all
      @comment = @idea.comments.build
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :picture)
    end

   
end
