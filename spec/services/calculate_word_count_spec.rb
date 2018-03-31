require 'rails_helper'

RSpec.describe CalculateWordCount, type: :service do
  describe '#call' do
    let!(:target_word) { Word.create!(value: 'objective') }
    let(:target_letter) { 'e' }
    let!(:word) { Word.create!(value: 'object') }
    let!(:invalid_word) { Word.create!(value: 'beak') }
    let!(:invalid_word_2) { Word.create!(value: 'adjective') }
    let!(:invalid_word_3) { Word.create!(value: 'bitt') }

    it 'returns the number of potential words' do
      expect(described_class.new(target_word, target_letter).call).to eq 2
    end
  end
end
