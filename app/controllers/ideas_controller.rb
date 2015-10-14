class IdeasController < ApplicationController
  helper_method :sort_column, :sort_direction

  respond_to :json, :html

  def index
    @ideas = Idea.search(params[:search]).order(sort_column + " " + sort_direction)
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

  def sort_column
    if params[:sort]
      Idea.column_names.include?(params[:sort]) ? params[:sort] : "title"
    else
      Idea.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end