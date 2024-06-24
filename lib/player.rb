class Player
  attr_reader :name, :grid, :ships, :moves, :hits

  # Initializes a new instance of the Player class.
  #
  # @param name [String] The name of the player.
  # @param grid_size [Integer] The size of the grid.
  # @param ship_positions [Array of integer] The positions of the ships.
  # @param moves [Array of integer] The moves made by the player.
  def initialize(name, grid_size, ship_positions, moves)
    @name = name
    @grid = Grid.new(grid_size)
    @ships = ship_positions.map { |pos| Ship.new(pos) }
    @moves = moves
    @hits = 0

    place_ships
  end

  # Places the ships on the grid.
  #
  # This method iterates over each ship in the `ships` array and calls the `place_ship` method on the `grid` object, passing the current ship as an argument.
  def place_ships
    ships.each { |ship| grid.place_ship(ship) }
  end

  # Attacks the opponent's grid at the specified move.
  #
  # @param opponent [Player] The opponent to attack.
  # @param move [Array<Integer>] The coordinates of the move.
  def attack(opponent, move)
    result = opponent.grid.receive_attack(move)
    @hits += 1 if result == :hit
  end
end
