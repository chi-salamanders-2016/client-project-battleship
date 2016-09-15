require 'rails_helper'

describe Boat do
  
  describe "on valid boat creation" do
  
    let(:boat) { Boat.new(name: "HMS Bounty", length: 4, bow_index: 0, stern_index: 3, board_id: 1) }
  
    it "has a name" do
      expect(boat.name).to eq "HMS Bounty"
    end

    it "has a length" do
      expect(boat.length).to eq 4
    end

    it "has a bow_index" do
      expect(boat.bow_index).to eq 0
    end

    it "has a stern_index" do
      expect(boat.stern_index).to eq 3
    end

    it "has a board_id" do
      expect(boat.board_id).to eq 1
    end

  end
end
