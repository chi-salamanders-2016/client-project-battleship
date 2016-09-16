class Board < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :shots
  has_many :boats

  def get_or_init_fleet
    @fleet = []
    for name, size in self.class.fleet_stats
      boat = Boat.find_by board_id: self.id, name: name
      if not boat
        @fleet << Boat.new( board_id: self.id, name: name, length: size )
      else
        @fleet << boat
      end
    end
    @fleet
  end

  def all_cells
    cells = {}
    p self.boats
    self.boats.each do |boat|
      p boat.name, boat.cells
      boat.cells.each {|cell| cells[cell] = boat.name.downcase}
    end
    cells
  end


  def self.eligible_cells(boat_name, cell_id)
    cell_index = cell_id.split('_')[-1].to_i
    boat_length = fleet_stats[boat_name]

    cells = [cell_index + boat_length, cell_index - boat_length]
    cells << (cell_index + boat_length*10)
    cells << (cell_index - boat_length*10)

    JSON.dumps(cells)

  end

  def self.boat_names
    %w(carrier battleship destroyer submarine cruiser)
  end

  def self.fleet_stats
    boat_names.zip([5,4,3,3,2]).to_h
  end
end 
