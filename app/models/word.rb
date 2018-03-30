# frozen_string_literal: true

class Word < ActiveRecord::Base
  has_many :games

  validates :value,
            presence: true,
            uniqueness: true,
            length: { in: 4..9 }

  scope :target_word, -> { where 'length(value) = 9' }

  scope :for_letter, ->(letter) { where('value like ?', "%#{letter}%") }

  scope :for_word, ->(word) { where('value ~* ?', "[#{word}]{4,}") }
end
