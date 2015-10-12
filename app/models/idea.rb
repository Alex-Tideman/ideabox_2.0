class Idea < ActiveRecord::Base

  validates :title, :body, presence: true

  before_save :quality_word

  def quality_word
    if quality == 1
      "Swill"
    elsif quality == 2
      "Plausible"
    else
      "Genius"
    end
  end

end
