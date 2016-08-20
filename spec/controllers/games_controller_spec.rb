require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  render_views

  let!(:word) { Word.create!(value: 'jazziness') }

  describe '#new' do
    subject { get :new }

    it { is_expected.to render_template :new }
  end

  describe '#create' do
    subject(:create_call) { post :create }

    it 'creates a new game' do
      expect { create_call }.to change { Game.count }.by 1
    end

    it { is_expected.to redirect_to Game.last }
  end

  describe '#show' do
    let(:game) { CreateGame.new.call }

    subject { get :show, params: { id: game } }

    it { is_expected.to render_template :show }
  end
end
