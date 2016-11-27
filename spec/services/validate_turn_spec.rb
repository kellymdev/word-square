require 'rails_helper'

RSpec.describe ValidateTurn do
  describe '#call' do
    let!(:target_word) { Word.create!(value: 'jazziness') }
    let!(:game) { CreateGame.new.call }

    subject { ValidateTurn.new(game, word).call }

    before do
      game.update!(target_letter: 'a')
      Word.create!(value: 'jazz')
      Word.create!(value: 'jezz')
    end

    context 'with a valid word' do
      let(:word) { 'jazz' }

      it { is_expected.to eq true }
    end

    context 'with an invalid word' do
      let(:word) { 'jazi' }

      it { is_expected.to eq false }
    end

    context "when the word doesn't contain the target letter" do
      let(:word) { 'jezz' }

      it { is_expected.to eq false }
    end

    context "when the word doesn't contain the correct letters" do
      let(:word) { 'name' }

      before do
        Word.create!(value: 'name')
      end

      it { is_expected.to eq false }
    end

    context 'when the word has already been guessed' do
      let(:word) { 'jazz' }

      before do
        game.turns.create(guess: 'jazz')
      end

      it { is_expected.to eq false }
    end
  end
end
