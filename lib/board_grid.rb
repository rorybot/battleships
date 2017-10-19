class BoardGrid

  attr_reader :alphanum_grid
  def initialize
    @alphanum_grid = []
    # set_board_grid
  end

  def set_board_grid
    return @alphanum_grid = create_array_of_hashes(place_every_set_of_ten_into_array)
  end

  private

  def create_array_of_hashes(twoD_array)
    twoD_array.map! do |row|
      Hash[convert_every_element_to_grid_ref_plus_water(row)]
    end
  end

  def convert_every_element_to_grid_ref_plus_water(row,value = 'Water')
    row.collect { |symbol_key| [symbol_key, value] }
  end

  def place_every_set_of_ten_into_array(array_method = produce_array_of_symbols)
    array_of_symbols = array_method
    array_of_array_of_symbols = []
    array_of_symbols.each_slice(10){|ten| array_of_array_of_symbols << ten}
    return array_of_array_of_symbols
  end

  def produce_array_of_symbols
    letters = ('A'..'J').to_a
    numbers = ('1'..'10').to_a
    return letters.product(numbers).map { |letter, number| (letter+number).to_sym }
  end




end
