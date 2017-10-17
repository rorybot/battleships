require 'board'

describe 'Board initialisation' do


  it 'has a hash representing row A' do
    board = Board.new
    p board.row_a
    expect(board.row_a).to eq({:A1 => 'Water', :A10 => 'Water', :A2 => 'Water', :A3 => 'Water', :A4 => 'Water', :A5 => 'Water', :A6 => 'Water', :A7 => 'Water', :A8 => 'Water', :A9 => 'Water'})

    # (player_id => Player.last.id)
  end

describe 'Board analysis' do
  it 'can inspect the state of a row entry' do
    board = Board.new
    expect(board.periscope(:A9)).to eq ('Water')
  end

  it 'should find it occupied' do
    board = Board.new
    board.row_a[:A1] = 'battleship'
    expect(board.periscope(:A1)).to eq ('battleship')
  end

  it 'can inspect the a number of rows along' do
    board = Board.new
    board.row_a[:A2] = 'battleship'
    expect(board.radar([:A1, :A2, :A3])).to eq(["A1 is free!", "A2 is blocked!", "A3 is free!"])
  end
end

end
