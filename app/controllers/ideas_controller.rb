class IdeasController < ApplicationController
  respond_to :json

  def index
    @ideas = Idea.all
  end

  def create
    @idea = Idea.create(idea_params)
    respond_with @idea
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update_attributes(idea_params)
    redirect_to root_path
  end

  def destory
    @idea = Idea.find(params[:id])
    @idea.destroy
  end

  private

  def idea_params
    params.require(:idea).permit(:title,:body,:quality)
  end

end