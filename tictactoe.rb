class Board
  def initialize
    @board = [{a1: "__", a2: "__", a3: "__"}, {b1: "__", b2: "__", b3: "__"}, {c1: "__", c2: "__", c3: "__"}]
  end

  def display
    puts " __ __ __"
    @board.each do |row|
      row.each_value do |cell|
        print "|#{cell}"
      end
      puts "|"
    end
    puts ""
  end

  def play
  end
end

class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

puts "Let's play Tic Tac Toe!"
board = Board.new
board.display

print "Enter first player name: "
name = gets.chomp
print "Would you like to play O or X? "
symbol = gets.chomp
player1 = Player.new(name, symbol)
=begin
need to change this so I can do some checks on valid name and symbol
+ same for second player
=end
