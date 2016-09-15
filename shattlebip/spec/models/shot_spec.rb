require 'rails_helper'

describe Shot do
  
  describe "on valid shot creation" do
    
    let(:shot) { Shot.new(board_id: 1, target_index: 99)}

    it "has a board_id" do
      expect(shot.board_id).to eq 1
    end

    it "has a target_index" do
      expect(shot.target_index).to eq 99
    end
    
  end 
end
