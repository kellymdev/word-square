class Turn < ActiveRecord::Base
  belongs_to :game

  validates :guess,
    presence: true,
    length: { in: 4..9 }
end
