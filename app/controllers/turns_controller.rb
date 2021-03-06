# frozen_string_literal: true

class TurnsController < ApplicationController
  before_action :find_game

  def create
    if ValidateTurn.new(@game, turn_params[:guess]).call
      @turn = @game.turns.create!(turn_params)
    else
      flash[:error] = "The word '#{turn_params[:guess]}' is invalid"
    end

    redirect_to @game
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def turn_params
    params.require(:turn).permit(:guess)
  end
end
