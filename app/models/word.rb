class Word < ActiveRecord::Base
  has_many :games

  validates :value,
    presence: true,
    length: { in: 4..9 }
end
