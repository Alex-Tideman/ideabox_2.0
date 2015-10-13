class QualityController < ApplicationController

  def edit
    @idea = Idea.find(params[:id])

  end

  def up
    idea = Idea.find(params[:id])
    if idea.quality == 1
      idea.update(quality: 2)
    elsif idea.quality == 2
      idea.update(quality: 3)
    end
  end

  def down
    idea = Idea.find(params[:id])
    if idea.quality == 3
      idea.update(quality: 2)
    elsif idea.quality == 2
      idea.update(quality: 1)
    end
  end


end