class ShotsController < ApplicationController

	def create
		@shot = Shot.new(target_index: params[:shot], board_id: params[:board_id])
		if @shot.save
			redirect to game_board_path(params[:game_id], params[:board_id])
		end
	end
	
end