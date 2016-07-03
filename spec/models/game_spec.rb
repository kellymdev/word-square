require 'rails_helper'

RSpec.describe Game, type: :model do
  subject(:game) { Game.new(target_letter: letter) }
  let(:letter) { "a" }

  describe "validations" do
    context "with no target letter" do
      let(:letter) { "" }

      it { is_expected.to be_valid }
    end

    context "with a single target letter" do
      it { is_expected.to be_valid }
    end

    context "with a two character target letter" do
      let(:letter) { "ab" }

      it { is_expected.not_to be_valid}
    end
  end
end
