class CreateGame
  def initialize
    @game = Game.create!
  end

  def call
    assign_random_word
    letters = shuffle_letters
    assign_target_letter(letters)
    @game.save!
    @game
  end

  private

  def assign_random_word
    @game.word = random_word
  end

  def assign_target_letter(letters)
    @game.target_letter = letters.pop
    @game.letters = letters.join
  end

  def shuffle_letters
    @game.word.value.chars.shuffle
  end

  def random_word
    Word.target_word.order('random()').first
  end
end
