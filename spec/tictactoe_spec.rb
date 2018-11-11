require './board'
require './player'

describe Board do

  let(:player1) { double("Test player 1", name: "Tester 1", symbol: "X") }
  let(:player2) { double("Test player 2", name: "Tester 2", symbol: "O") }
  let(:board) { Board.new(player1,player2) }

  describe "#next_turn" do
    it "prints a victory message with the correct player and exits the program when the board reads X X X across the top row" do
      board.instance_variable_set("@cells", ["X","X","X","_","_","_","_","_","_"])
      begin
        expect(board.send(:next_turn, player1)).to output("The winner is #{player1.name}. Congratulations!").to_stdout
      rescue SystemExit
        puts "Exiting the game"
      end
    end

    it "prints a message and ends the game when the board is full" do
      board.instance_variable_set("@cells", ["O","X","O","O","X","X","X","O","O"])
      begin
        expect(board.send(:next_turn, player1)).to output("The board is full, and no one won. Sorry!").to_stdout
      rescue SystemExit
        puts "Exiting the game"
      end
    end
  end

end

