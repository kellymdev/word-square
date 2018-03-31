# frozen_string_literal: true

class CalculateWordCount
  attr_reader :word, :target_letter

  def initialize(word, target_letter)
    @word = word
    @target_letter = target_letter
  end

  def call
    word_count
  end

  private

  def word_count
    letters = word.value.chars

    word_list.select do |potential_word|
      potential_letters = potential_word.value.chars.sort

      letters.each do |letter|
        index_of_letter = potential_letters.index(letter)
        next unless index_of_letter

        potential_letters[index_of_letter] = nil
      end

      potential_letters.compact.empty?
    end.count
  end

  def word_list
    Word.for_letter(target_letter).for_word(word.value)
  end
end
