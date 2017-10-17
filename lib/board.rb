
class Board

  attr_reader :alphanum_grid, :row_a, :row_b, :row_c, :row_d, :row_e, :row_f, :row_g, :row_h, :row_i, :row_j

  def initialize
    letters = ('A'..'J').to_a
    numbers = (1..10).to_a
    @alphanum_grid = letters.map{|letter| numbers.map{|number| (letter+number.to_s).to_sym}}

    hashify_the_grid
    row_variable_namer

  end

  def periscope(grid_ref)
    alphanum_grid.each{|row| row.include? grid_ref
      return row[grid_ref]
    }

  end

private

  def row_variable_namer
    letter_start = 'a'
    alphanum_grid.each{|i| row = instance_variable_set("@row_#{letter_start}", i)
    letter_start.next!
    }
  end

def hashify_the_grid
  @alphanum_grid.map!{|row|
     Hash[row.collect { |v| [v, 'Water']}]
  }
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


end
