require 'ship'

describe 'Ship creation' do
  it 'can create a cruiser' do
    cruiser = Ship.new('cruiser')
    expect(cruiser.length).to eq(3)
  end
    # (player_id => Player.last.id)
  end
