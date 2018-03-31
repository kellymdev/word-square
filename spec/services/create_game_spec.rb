require 'rails_helper'

RSpec.describe CreateGame, type: :service do
  let!(:word) { Word.create!(value: 'jazziness') }

  subject(:game_service) { CreateGame.new.call }

  describe '#call' do
    let(:game) { Game.last }

    it 'creates a new game' do
      expect { game_service }.to change { Game.count }.by 1
    end

    it 'assigns a random word for the game' do
      game_service
      expect(game.word).to be_present
    end

    it 'assigns a target letter for the game' do
      game_service
      expect(game.target_letter).to be_present
    end

    it 'calculates the potential word count' do
      game_service
      expect(game.word_count).to be_present
    end
  end
end
