class Ship
  attr_reader :position

  # Initializes a new instance of the Ship class.
  #
  # @param position [Array<Integer>] The coordinates of the ship's position.
  def initialize(position)
    @position = position
  end
end
