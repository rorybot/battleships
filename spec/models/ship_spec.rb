require 'ship'

describe 'Ship creation' do
  it 'can create a cruiser' do
    cruiser = Ship.new('cruiser')
    expect(cruiser.length).to eq(3)
  end

  it 'cannot create nonexistent ship' do
    expect{Ship.new('star destroyer')}.to raise_error('No such ship in our fleet, Admiral!')
  end
    # (player_id => Player.last.id)
  end
