class ValidateTurn
  def initialize(game, word)
    @game = game
    @word = word
  end

  def call
    contains_target_letter? && valid_word? && contains_correct_letters? && !duplicate_word?
  end

  private

  def valid_word?
    Word.find_by(value: @word).present?
  end

  def duplicate_word?
    @game.turns.pluck(:guess).include?(@word)
  end

  def contains_correct_letters?
    (@word.chars - @game.word.value.chars).empty?
  end

  def contains_target_letter?
    @word.chars.include?(@game.target_letter)
  end
end
