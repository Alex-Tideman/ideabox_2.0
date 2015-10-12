class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def create
    @idea = Idea.create(idea_params)
    render json: @idea
  end

  def update
    @idea = Idea.update_attributes(idea_params)
    render json: @idea
  end

  def destory
    @idea.destroy
  end

  private

  def idea_params
    params.permit(:title,:body,:quality)
  end

end