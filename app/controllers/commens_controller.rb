class CommensController < ApplicationController
  before_action :set_commen, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @commens = Commen.all
    respond_with(@commens)
  end

  def show
    respond_with(@commen)
  end

  def new
    @commen = Commen.new
    respond_with(@commen)
  end

  def edit
  end

  def create
    @commen = Commen.new(commen_params)
    @commen.save
    respond_with(@commen)
  end

  def update
    @commen.update(commen_params)
    respond_with(@commen)
  end

  def destroy
    @commen.destroy
    respond_with(@commen)
  end

  private
    def set_commen
      @commen = Commen.find(params[:id])
    end

    def commen_params
      params.require(:commen).permit(:user_name, :body, :idea_id)
    end
end
