class Board < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :shots
  has_many :boats

  def get_or_init_fleet
    
    @fleet = []

    for name, size in fleet_stats
      boat = Boat.find_by board_id: self.id, name: name

      if not boat
        @fleet << Boat.new( board_id: self.id, name: name, length: size )
      else
        @fleet << boat
      end

    end
    @fleet
  end


  private 
  def fleet_stats
    names = %w(carrier battleship destroyer submarine cruiser)
    names.zip([5,4,3,3,2]).to_h
  end
end 
