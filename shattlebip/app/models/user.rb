class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, :length => { :minimum => 6 }

  def games_won
  	#change this later to actual method of calculating games won
  	return 10 #has to return an integer
  end

  def win_loss_ratio
  	#change this later to acutal method
  	return 48.5	#returns a decimal of win loss ratio
  end

  def total_shots_fired
		#change this later to acutal method
		return 1000  #has to return an integer
  end

  def calculate_accuracy
  	#change this later to acutal method of calculating accuracy
  	return 3.5 #returns a decimal of percent accuracy
  end
end
