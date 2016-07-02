class CreateGame
  def call
    game = Game.create!
    assign_random_word_for(game)
    game
  end

  private

  def assign_random_word_for(game)
    game.word = random_word
    game.save!
  end

  def random_word
    Word.target_word.order("random()").first
  end
end
