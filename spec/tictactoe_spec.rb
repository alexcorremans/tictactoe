require './board'
require './player'

describe Player do

  before do
    allow($stdout).to receive(:write)
  end

  describe "#initialize" do
    it "creates a first player and assigns a name and a symbol based on user input" do
      allow_any_instance_of(Player).to receive(:gets).and_return("first player\n", "O\n")
      player1 = Player.new
      expect(player1.name).to eql("First player")
      expect(player1.symbol).to eql("O")
    end

    it "creates a second player and assigns a name based on user input and the remaining symbol based on the first player's choice" do
      allow_any_instance_of(Player).to receive(:gets).and_return("second player\n")
      player2 = Player.new
      expect(player2.name).to eql("Second player")
      expect(player2.symbol).to eql("X")
    end
  end

end

describe Board do

  before do
    allow($stdout).to receive(:write)
  end

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

