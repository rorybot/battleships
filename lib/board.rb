
class Board

  attr_reader :alphanum_grid, :row_a, :row_b, :row_c, :row_d, :row_e, :row_f, :row_g, :row_h, :row_i, :row_j

  def initialize
    letters = ('A'..'J').to_a
    numbers = (1..10).to_a
    @alphanum_grid = letters.map{|letter| numbers.map{|number| (letter+number.to_s).to_sym}}

    hashify_the_grid
    row_variable_namer


  end

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
