class GamesController < ApplicationController
  def new
  end

  def create
    @game = CreateGame.new.call
  end
end
