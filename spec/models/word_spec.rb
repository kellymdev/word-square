require 'rails_helper'

RSpec.describe Word, type: :model do
  subject(:word) { Word.new(value: value) }
  let(:value) { 'abcd' }

  describe 'validations' do
    context 'without a value' do
      let(:value) { '' }

      it { is_expected.not_to be_valid }
    end

    context 'with only 3 letters' do
      let(:value) { 'abc' }

      it { is_expected.not_to be_valid }
    end

    context 'with 4 letters' do
      let(:value) { 'abcd' }

      it { is_expected.to be_valid }
    end

    context 'with 9 letters' do
      let(:value) { 'abcdefghi' }

      it { is_expected.to be_valid }
    end

    context 'with 10 letters' do
      let(:value) { 'abcdefghij' }

      it { is_expected.not_to be_valid }
    end

    context 'when the word already exists' do
      let!(:existing_word) { Word.create!(value: value) }

      it { is_expected.not_to be_valid }
    end
  end
end
