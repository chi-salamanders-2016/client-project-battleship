class Boat < ActiveRecord::Base
  belongs_to :board

  validates :length, :board_id, presence: true

  validates :bow_index, :stern_index, numericality: { only_integer: true, 
    less_than: 100 }

  validates :name, presence: true, uniqueness: { scope: :board,
    message: "each board gets only one of each kind of ship" }

#   def coordinates_from_endpoints
#     if self.bow_index > self.stern_index && self.bow_index - (self.length - 1) = self.stern_index #horizontal, facing right
#       Array (self.stern_index..self.bow_index)
#     elsif self.stern_index > self.bow_index && self.stern_index - (self.length - 1) = self.bow_index #horizontal, facing left
#       Array (self.bow_index..self.stern_index)
#     elsif self.bow_index > self.stern_index && !(self.bow_index - (self.length - 1) = self.stern_index) #vertical, facing up
#       array = Array (self.stern_index..self.bow_index)
#       array = array.select { |num| num % 10 == bow_index % 10 }
#     else self.stern_index > self.bow_index && !(self.stern_index - (self.length - 1) = self.bow_index) #vertical, facing down
#       array = Array (self.bow_index..self.stern_index)
#       array = array.select { |num| num % 10 == bow_index % 10 }
#     end  		
#   end
  
  

#   def all_coordinates
#   end

#   def number_of_hits
#   	all_shots_array = Shots.all.map { |shot| shot.target_index }
#   	hits_array = coordinates_from_endpoints & all_shots_array
#   	hits_array.length
#   end

#   def sunk?
#   	if number_of_hits == self.length
#   	  true
#   	else
#   	  false
#   	end
#   end
end
