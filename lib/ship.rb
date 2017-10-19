class Ship

  attr_reader :length

  def initialize(ship_name)
    @length = nil
    ship_creation(ship_name)
  end

  def ship_creation(name)
    ship_hash = {
      'cruiser' => 3,
      'battleship' => 4,
      'carrier' => 5,
      'submarine' => 3,
      'destroyer' => 2
    }

    return @length = ship_hash[name] if ship_hash.key?(name)
    'No such ship in our fleet, Admiral!'
    #
    #
    # if name == 'cruiser'
    #   @length = 3
    # elsif name == 'battleship'
    #   @length = 4
    # elsif name == 'carrier'
    #   @length = 5
    # elsif name == 'submarine'
    #   @length = 3
    # elsif name == 'destroyer'
    #   @length = 2
    # else
    #   'No such ship in our fleet, Admiral!'
    # end
  end

end
