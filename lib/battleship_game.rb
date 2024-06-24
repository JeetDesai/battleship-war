require_relative 'player'
require_relative 'grid'
require_relative 'ship'
require_relative 'missile'

class BattleshipGame

  # Initializes a new instance of the BattleshipGame class.
  # @param input_file [String] The path to the input file.
  def initialize(input_file)
    puts "Initialize"
    read_input(input_file)
  end

  # Reads the input from the specified file and initializes the game state.
  # @param file [String] The path to the input file.
  def read_input(file)
    # file parameter has name of file which is in same directory of current ruby file
    # file = "input.txt"
    input = File.readlines(file).map(&:chomp)
    @grid_size = input[0].to_i
    @total_ships = input[1].to_i
    player1_ships = input[2].split(':').map { |pos| pos.split(',').map(&:to_i) }
    player2_ships = input[3].split(':').map { |pos| pos.split(',').map(&:to_i) }
    @total_missiles = input[4].to_i
    player1_moves = input[5].split(':').map { |move| move.split(',').map(&:to_i) }
    player2_moves = input[6].split(':').map { |move| move.split(',').map(&:to_i) }

    @player1 = Player.new('Player 1', @grid_size, player1_ships, player1_moves)
    @player2 = Player.new('Player 2', @grid_size, player2_ships, player2_moves)
  end

  # Executes the game loop for the specified number of missiles.
  def play
    (0...@total_missiles).each do |i|
      @player1.attack(@player2, @player1.moves[i])
      @player2.attack(@player1, @player2.moves[i])
    end
    write_output
  end

  # Writes the output of the game to a file named 'output.txt' in the parent directory.
  #
  # This method opens the file in write mode and writes the following information:
  # - The name of Player 1
  # - The grid display of Player 1
  # - The name of Player 2
  # - The grid display of Player 2
  # - The number of hits for Player 1
  # - The number of hits for Player 2
  # - The result of the game (Player 1 wins, Player 2 wins, or It is a draw)
  def write_output
    puts "----Results----"
    puts "Player 1 grid"
    puts @player1.grid.display
    puts "Player 2 grid"
    puts @player2.grid.display
    puts "----Results statistics----" 
    puts "Player 1 Hits:#{@player1.hits}"
    puts "Player 2 Hits:#{@player2.hits}"
    puts game_result
    File.open(File.join(__dir__, '..', 'data', 'output.txt'), 'w') do |file|
      file.puts "Player 1"
      file.puts @player1.grid.display
      file.puts "Player 2"
      file.puts @player2.grid.display
      file.puts "P1:#{@player1.hits}"
      file.puts "P2:#{@player2.hits}"
      file.puts game_result
    end
  end

  # Determines the result of the game based on the number of hits for each player.
  # Returns a string indicating whether Player 1 wins, Player 2 wins, or it is a draw.
  def game_result
    if @player1.hits > @player2.hits
      "Player 1 wins"
    elsif @player2.hits > @player1.hits
      "Player 2 wins"
    else
      "It is a draw"
    end
  end
end

input_file_path = File.join(__dir__, '..', 'data', 'input.txt')
battleship = BattleshipGame.new(input_file_path)
battleship.play