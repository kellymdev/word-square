require 'rails_helper'

RSpec.describe CalculateWordCount, type: :service do
  describe '#call' do
    let!(:target_word) { Word.create!(value: 'objective') }
    let(:target_letter) { 'o' }
    let!(:word) { Word.create!(value: 'object') }
    let!(:invalid_word) { Word.create!(value: 'book') }

    it 'returns the number of potential words' do
      expect(described_class.new(target_word, target_letter).call).to eq 2
    end
  end
end
