class Game < ActiveRecord::Base
  belongs_to :word
  has_many :turns

  validates :target_letter,
    length: { is: 1 },
    allow_blank: true
end
