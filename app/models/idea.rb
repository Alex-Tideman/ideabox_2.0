class Idea < ActiveRecord::Base
  attr_accessor :quality_word
  attr_reader :trunc_body

  validates :title, :body, presence: true
  before_save :capitalize

  def capitalize
    self.title = title.slice(0,1).capitalize + title.slice(1..-1)
    self.body = body.slice(0,1).capitalize + body.slice(1..-1)
  end

  def quality_word
    if quality == 1
      "Swill"
    elsif quality == 2
      "Plausible"
    else
      "Genius"
    end
  end

  def trunc_body
    if body.length > 100
      body.truncate(100, separator: ' ')
    else
      body
    end
  end

  def self.search(search)
    if search
      where('title ILIKE ?', "%#{search}%")
    else
      all
    end
  end


end
