# frozen_string_literal: true

class GamesController < ApplicationController
  def new; end

  def create
    @game = CreateGame.new.call

    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @turn = Turn.new
  end
end
