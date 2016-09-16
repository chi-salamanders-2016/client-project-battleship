module BoardsHelper

  def cell_class(row, column)
    class_string = "cell "
    index = row*10 + column
    if @board.all_cells.keys.include? index
      class_string << "assigned #{@board.all_cells[index]}"
    else
      class_string << "eligible bow"
    end
    class_string
  end
end
