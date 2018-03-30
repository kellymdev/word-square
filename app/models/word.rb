class Word < ActiveRecord::Base
  has_many :games

  validates :value,
            presence: true,
            uniqueness: true,
            length: { in: 4..9 }

  scope :target_word, -> { where 'length(value) = 9' }
end
