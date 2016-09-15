class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def index
    @games = Game.all
  end

  private
    def game_params
      params.require(:game).permit(:name)
    end

end