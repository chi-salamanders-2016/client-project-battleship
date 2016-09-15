class SessionsController < ApplicationController
	def new
		#login form is rendered
	end

	def create
		authorized_user = User.find_by(email: params[:email]).try(:authenticate, params[:password]) 
		if authorized_user
			session[:user_id]= authorized_user.id
			redirect_to authorized_user
		else
			@error = "email or password is incorrect"
			render :new
		end
	end

	def destroy 
		session.delete(:user_id)
		redirect_to new_session_path
	end
end