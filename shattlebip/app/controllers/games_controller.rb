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
    @board = Board.new
    @my_waiting_games = one_player_games - games_not_init_by_me
    @my_joinable_games = one_player_games - games_init_by_me
    @my_active_games = my_active_games
    # binding.pry
  end

  private
    def one_player_games
      games = Game.all
      games = games.select { |game| game.boards.length == 1 }
      games
    end

    def two_player_games
      games = Game.all
      games = games.select { |game| game.boards.length == 2 }
      games
    end

    # def not_my_two_player_games
      
    # end

    def boards_init_by_me
      boards = Board.all
      boards.select { |board| board.user_id == session[:user_id] }
    end

    def games_init_by_me
      boards_init_by_me.map { |board| board.game }
    end

    def boards_not_init_by_me
      boards = Board.all
      boards.select { |board| board.user_id != session[:user_id] }
    end

    def games_not_init_by_me
      boards_not_init_by_me.map { |board| board.game }
    end

    def my_active_games
      all_active_boards = two_player_games.map { |game| game.boards }
      all_active_boards = all_active_boards.flatten
      my_boards = all_active_boards.select { |board| board.user_id == session[:user_id]}
      my_active_games = my_boards.map { |board| board.game }
      my_active_games
     end

    # def initiated_game_boards
    #   # all_games = all_games_awaiting_opponent
    #   # all_boards = all_games.map { |game| game.boards }
    #   # all_boards.select { |board| board.user_id == session[:user_id] } 
    #   single_boards = Board.select(:game_id).distinct
    #   user_boards = Board.where(user_id: session[:user_id])

    # end

    # def joinable_games
    #   all_games_awaiting_opponent.map { |game| game.boards.select { |board| board.user_id != session[:user_id] } }
    # end

    # def all_in_progress_games
    #   games = Game.all
    #   games.map { |game| game.boards.length == 2 }
    #   games
    # end

    # def games_in_progress
    #   all_in_progress_games.map { |game| game.boards.where(:user_id == session[:user_id]) }
    # end

    def game_params
      params.require(:game).permit(:name)
    end

end
