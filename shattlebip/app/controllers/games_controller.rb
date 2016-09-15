class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      @board = Board.create!(user_id: session[:user_id], game_id: @game.id)
      redirect_to games_path, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def index
    @initiated_games = initiated_games
    @joinable_games = joinable_games
    @games_in_progress = games_in_progress
  end

  private
    def all_games_awaiting_opponent
      games = Game.all
      games.map { |game| game.boards.length == 1 }
      games
    end

    def initiated_games
      all_games_awaiting_opponent.map { |game| game.boards.select { |board| board.user_id == session[:user_id] } }
    end

    def joinable_games
      all_games_awaiting_opponent.map { |game| game.boards.select { |board| board.user_id != session[:user_id] } }
    end

    def all_in_progress_games
      games = Game.all
      games.map { |game| game.boards.length == 2 }
      games
    end

    def games_in_progress
      all_in_progress_games.map { |game| game.boards.where(:user_id == session[:user_id]) }
    end

    def game_params
      params.require(:game).permit(:name)
    end

end
