require_relative 'board_grid'
class Board
  attr_reader :alphanum_grid, :row_A, :row_B, :row_C, :row_D, :row_E, :row_F, :row_G, :row_H, :row_I, :row_J

  def initialize
    @alphanum_grid = BoardGrid.new.set_board_grid
    @rows = []
    create_variables_for_each_row
  end

  def periscope(grid_ref)
    alphanum_grid.each do |row|
      row.include? grid_ref
      return contents_of(row, grid_ref)
    end
  end

  def place_ship(ship_placement_array, ship_type)
    ship_placement_array.each{|grid_ref| change_grid_ref(grid_ref, ship_type)}
  end


  def radar(grid_refs, ship_length = 3)
    message = []
    results = []
    grid_refs.each { |grid_ref|
      grid_ref_status_printer(grid_ref, message)
    }
    legal_move?(results, ship_length) + print_message(message)
  end

  def legal_move?(results, ship_length)
    return 'Go for it! ' if ship_length <= results.length
    'Bzzt - no can do! '
  end


  private

  def change_grid_ref(grid_ref, new_value)
    alphanum_grid.each do |row|
      row[grid_ref] = new_value if row.include? grid_ref
    end
  end

  def create_variables_for_each_row(twoD_array_representing_rows = alphanum_grid)
    letter_start = 'A'
    twoD_array_representing_rows.each do |i|
      new_variable = instance_variable_set("@row_#{letter_start}", i)
      letter_start.next!

    end
  end

  def print_message(message)
    message.join(', ')
  end

  def grid_ref_status_printer(grid_ref_input, message_array_output)
    return message_array_output << "#{grid_ref_input} is free!" if periscope(grid_ref_input) == 'Water'
    message_array_output << "#{grid_ref_input} is blocked!"
  end

  def contents_of(row, grid_ref)
    row[grid_ref]
  end

  #
  # def ship_placement(ship_size, first placement)
  #   1. Where do you want to place the ship
  #   2. How many free squares are there around that square?
  #   3. Is there enough for you to fit in?
  #   4. If not, return that it not enough space to fit there in any configuaration
  #
  #     therefore need a method that
  #   1. Look at current square
  #   2. Be able to tell when looking backwards and forwards across that row where placement cna be made
  #     3. With a prohibition that index number cannot be less than 0 or greater than 9
  #
  #     and a method that
  #   4. Be able to look at index number of row above it
  #   5. Check if that one free
  #   6. Check index number of row below it
  #     7. Check if that one free
  #
  #   8. Return an array of all the possible free spaces it found
  #
  #   end

  # When Drop a ship, it will also have to record back to an instance of that ship what bits it was dropped on
end
