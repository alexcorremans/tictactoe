require_relative 'player'
require_relative 'board'

puts "Let's play Tic Tac Toe!"

player1 = Player.new
player2 = Player.new
puts "\nPlayers:\n#{player1.name} - #{player1.symbol}\n#{player2.name} - #{player2.symbol}"
puts ""

board = Board.new(player1, player2)
board.start_game
