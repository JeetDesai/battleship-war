class Missile
  attr_reader :position

  # Initializes a new instance of the Missile class.
  #
  # @param position [Array<Integer>] The coordinates of the missile's position.
  def initialize(position)
    @position = position
  end
end
