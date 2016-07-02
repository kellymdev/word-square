class Word < ActiveRecord::Base
  validates :value,
    presence: true,
    length: { in: 4..9 }
end
