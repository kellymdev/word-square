class ValidateTurn
  def initialize(game, word)
    @game = game
    @word = word
  end

  def call
    contains_target_letter? && valid_word?
  end

  private

  def valid_word?
    Word.find_by(value: @word).present?
  end

  def contains_target_letter?
    @word.chars.include?(@game.target_letter)
  end
end
