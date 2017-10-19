require 'board'

describe 'Board initialisation' do
  it 'has a hash representing row A' do
    board = Board.new
    expect(board.row_a).to eq(A1: 'Water', A10: 'Water', A2: 'Water', A3: 'Water', A4: 'Water', A5: 'Water', A6: 'Water', A7: 'Water', A8: 'Water', A9: 'Water')

    # (player_id => Player.last.id)
  end

  describe 'Board analysis' do
    it 'can inspect the state of a row entry' do
      board = Board.new
      expect(board.periscope(:A9)).to eq 'Water'
    end

    it 'should find it occupied' do
      board = Board.new
      board.row_a[:A1] = 'battleship'
      expect(board.periscope(:A1)).to eq 'battleship'
    end

    it 'can inspect the a number of rows along' do
      board = Board.new
      board.row_a[:A2] = 'battleship'
      expect(board.radar(%i[A1 A2 A3])).to eq('Bzzt - no can do! A1 is free!, A2 is blocked!, A3 is free!')
    end

    it 'can inspect the row above at same column' do
      board = Board.new
      board.row_c[:c1] = 'battleship'
      expect(board.radar(%i[A1 B1 C1])).to eq('Bzzt - no can do! A1 is free!, B1 is blocked!, C1 is blocked!')
    end

    # These will become backbone of checking if a new boat placement is legal; when actually playing, you would only periscope a specific grid ref -- that would at least then assign it to an array of player's checked grid refs

    it 'checks if a set of spaces for boat placement is legal and gets LEGAL' do
      board = Board.new
      board.row_a[:A2] = 'battleship'
      results = [1, 2, 3]
      ship_length = 2
      expect(board.legal_move?(results, ship_length)).to eq 'Go for it! '
    end

    it 'checks if a set of spaces for boat placement is legal and gets ILLEGAL' do
      board = Board.new
      board.row_a[:A2] = 'battleship'
      results = [1, 2, 3]
      ship_length = 4
      expect(board.legal_move?(results, ship_length)).to eq 'Bzzt - no can do! '
    end
  end

  describe 'placing ships on the board' do
    it 'can register a ship as being placed' do
      board = Board.new
      ship_placement_array = :A1, :A2, :A3
      board.place_ship(ship_placement_array)
      expect(board.radar(ship_placement_array)).to eq 'Bzzt - no can do! A1 is blocked!, A2 is blocked!, A3 is blocked!'
    end
  end
end
