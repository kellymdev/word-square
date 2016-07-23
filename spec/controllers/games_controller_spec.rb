require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  render_views

  let!(:word) { Word.create!(value: 'jazziness') }

  describe '#new' do
    subject { get :new }

    it { is_expected.to render_template :new }
  end

  describe '#create' do
    it 'creates a new game' do
      expect { post :create }.to change { Game.count }.by 1
    end

    it 'redirects to the newly created game' do
      post :create
      expect(response).to redirect_to Game.last
    end
  end

  describe '#show' do
    let(:game) { CreateGame.new.call }

    subject { get :show, id: game }

    it { is_expected.to render_template :show }
  end
end
