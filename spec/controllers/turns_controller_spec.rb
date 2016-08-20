require 'rails_helper'

RSpec.describe TurnsController, type: :controller do
  let!(:target_word) { Word.create!(value: 'jazziness') }
  let(:game) { CreateGame.new.call }

  describe '#create' do
    it "creates a new turn" do
      expect { post :create, params: { game_id: game, turn: { guess: 'jazziness' } } }.to change { Turn.count }.by 1
    end
  end
end
