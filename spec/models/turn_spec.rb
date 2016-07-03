require 'rails_helper'

RSpec.describe Turn, type: :model do
  subject(:turn) { Turn.new(guess: guess) }
  let(:guess) { "" }

  describe "validations" do
    context "with a blank guess" do
      it { is_expected.not_to be_valid }
    end

    context "with a three letter guess" do
      let(:guess) { "abc" }

      it { is_expected.not_to be_valid }
    end

    context "with a four letter guess" do
      let(:guess) { "abcd" }

      it { is_expected.to be_valid }
    end

    context "with a nine letter guess" do
      let(:guess) { "abcdefghi" }

      it { is_expected.to be_valid }
    end

    context "with a ten letter guess" do
      let(:guess) { "abcdefghij" }

      it { is_expected.not_to be_valid }
    end
  end
end
