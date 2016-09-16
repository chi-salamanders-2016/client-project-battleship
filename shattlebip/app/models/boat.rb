class Boat < ActiveRecord::Base
  belongs_to :board

  validates :length, :board_id, presence: true

  validates :bow_index, :stern_index, numericality: { only_integer: true, 
    less_than: 100 }

  validates :name, presence: true, uniqueness: { scope: :board,
    message: "each board gets only one of each kind of ship" }

  def cells 
    a = self.bow_index
    b = self.stern_index
    if a > b
      t = a; a = b; b = t
    end
    if (a-b).abs < 10
      cells = (a..b).to_a
    else
      cells = (a..b).step(10).to_a
    end
    cells
  end
  

#   def all_coordinates
#   end

#   def number_of_hits
#   	all_shots_array = Shots.all.map { |shot| shot.target_index }
#   	hits_array = coordinates_from_endpoints & all_shots_array
#   	hits_array.length
#   end

  # def sunk?
  # 	if number_of_hits == self.length
  # 	  true
  # 	else
  # 	  false
  # 	end
  # end
end
