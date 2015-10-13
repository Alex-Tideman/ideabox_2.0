class Idea < ActiveRecord::Base
  attr_accessor :quality_word

  validates :title, :body, presence: true

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
