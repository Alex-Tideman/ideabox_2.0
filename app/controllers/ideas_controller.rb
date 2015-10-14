class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    @ideas = Idea.search(params[:search]).order('created_at DESC')

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
    respond_with @idea
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    respond_with @idea
  end

  private

  def idea_params
    params.require(:idea).permit(:title,:body,:quality)
  end

end