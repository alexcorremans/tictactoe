require './board'
require './player'

describe Player do

  describe "#initialize" do
    it "creates a first player and assigns a name and a symbol based on user input" do
      # player1 defined globally so it can be referred to in the second test
      $player1 = Player.new
      expect($player1.name).not_to be_nil
      expect($player1.symbol).to eql("O").or(eql("X"))
    end

    it "creates a second player and assigns a name based on user input and the remaining symbol based on the first player's choice" do
      player2 = Player.new
      expect(player2.name).not_to be_nil
      if $player1.symbol == "X"
        expect(player2.symbol).to eql("O")
      else
        expect(player2.symbol).to eql("X")
      end
    end
  end

end

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

