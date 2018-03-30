# frozen_string_literal: true

class CalculateWordCount
  attr_reader :word, :target_letter

  def initialize(word, target_letter)
    @word = word
    @target_letter = target_letter
  end

  def call
    words.count
  end

  private

  def words
    Word.for_letter(target_letter).for_word(word.value)
  end
end
