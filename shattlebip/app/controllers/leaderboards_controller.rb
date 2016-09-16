class LeaderboardsController < ApplicationController
	def index
		@most_user_wins = User.all.sort {|a,b| a.games_won <=> b.games_won}.reverse
		@most_user_shots = User.all.sort {|a,b| a.total_shots_fired <=> b.total_shots_fired}.reverse
		@most_user_win_ratio = User.all.sort {|a,b| a.win_loss_ratio <=> b.win_loss_ratio}.reverse
		@most_user_accuracy = User.all.sort {|a,b| a.calculate_accuracy <=> b.calculate_accuracy}.reverse
	end
end