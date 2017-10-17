require 'board'

describe 'Board initialisation' do


  it 'has a hash representing row A' do
    board = Board.new
    p board.row_a
    expect(board.row_a).to eq({:A1 => 'Water', :A10 => 'Water', :A2 => 'Water', :A3 => 'Water', :A4 => 'Water', :A5 => 'Water', :A6 => 'Water', :A7 => 'Water', :A8 => 'Water', :A9 => 'Water'})

    # (player_id => Player.last.id)
  end

end
