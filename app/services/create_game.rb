class CreateGame
  def call
    game = Game.create!
    assign_random_word_for(game)
    assign_target_letter_for(game)
    game.save!
    game
  end

  private

  def assign_random_word_for(game)
    game.word = random_word
  end

  def assign_target_letter_for(game)
    game.target_letter = game.word.value.chars.sample
  end

  def random_word
    Word.target_word.order('random()').first
  end
end
