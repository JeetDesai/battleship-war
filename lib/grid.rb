class Grid

  # Initializes a new instance of the Grid class.
  #
  # @param size [Integer] The size of the grid.
  def initialize(size)
    @size = size
    @grid = Array.new(size) { Array.new(size, '_') }
  end

  # Places a ship on the grid at the specified position.
  # 'S' stands for ship
  # @param ship [Ship] The ship to be placed on the grid.
  def place_ship(ship)
    x, y = ship.position
    @grid[x][y] = 'S'
  end


  # Receives an attack at the specified position on the grid.
  # 'X' stands for hit
  # 'O' stands for miss
  # @param position [Array<Integer>] The coordinates of the attack.
  # @return [Symbol] The result of the attack.
  def receive_attack(position)
    x, y = position
    if @grid[x][y] == 'S'
      @grid[x][y] = 'X'
      :hit
    else
      @grid[x][y] = 'O'
      :miss
    end
  end

  # Displays the grid by joining each row with a space and joining all rows with a newline character.
  #
  # @return [String] the formatted grid display
  def display
    @grid.map { |row| row.join(' ') }.join("\n")
  end
end
