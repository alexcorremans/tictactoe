class Board
    def initialize(player1, player2)
      @cells = []
      @player1 = player1
      @player2 = player2
    end
  
    def start_game
      empty_board
      puts "Who would like to begin?"
      player = gets.chomp.capitalize
      while player.empty? || (player != @player1.name and player != @player2.name)
        puts "You didn't enter a name, or this person is currently not playing. Try again:"
        player = gets.chomp.capitalize
      end
      (player == @player1.name) ? start(@player1) : start(@player2)
    end
  
    private
  
    def empty_board
      9.times do
        @cells.push("_")
      end
    end
  
    def display(board)
      puts " ___ ___ ___"
      for i in (0..2)
        print "|_#{board[i]}_"
      end
      puts "|"
      for i in (3..5)
        print "|_#{board[i]}_"
      end
      puts "|"
      for i in (6..8)
        print "|_#{board[i]}_"
      end
      puts "|"
      puts ""
    end
  
    def display_numbers
      puts "Here are your choices:"
      @cells_numbers = @cells.each_with_index.map do |cell,i|
        if cell == "_"
          "#{i+1}"
        else
          "_"
        end
      end
      display(@cells_numbers)
    end
  
    def start(player)
      puts "\n#{player.name} starts!"
      display_numbers
      choice = choose_cell
      modify_board(player, choice)
      display(@cells)
      next_turn(player)
    end
  
    def play(player)
      puts "\nIt's your turn, #{player.name}!"
      choice = choose_cell
      modify_board(player, choice)
      display(@cells)
      next_turn(player)
    end
  
    def choose_cell
      puts "Enter your choice or type 'help' to see possible choices:"
      choice = gets.chomp
      if choice == "help"
        display_numbers
        puts "Enter your choice: "
        choice = gets.chomp.to_i
      else
        choice = choice.to_i
      end
      @cells.each do |cell|
        while !choice.between?(1,9) || !cell_empty?(choice)
          puts "That's not a valid number, or that cell isn't empty."
          choice = gets.chomp.to_i
        end
      end
      return choice
    end
  
    def cell_empty?(cell)
      @cells[cell-1] == "_" ? true : false
    end
  
    def modify_board(player, choice)
      @cells[choice-1] = player.symbol
    end
  
    def full?
      return @cells.all? {|cell| cell != "_"}
    end
  
    def winner?
      three_in_a_row = false
      @rows = [
        [@cells[0], @cells[1], @cells[2]],
        [@cells[3], @cells[4], @cells[5]],
        [@cells[6], @cells[7], @cells[8]],
        [@cells[0], @cells[3], @cells[6]],
        [@cells[1], @cells[4], @cells[7]],
        [@cells[2], @cells[5], @cells[8]],
        [@cells[0], @cells[4], @cells[8]],
        [@cells[6], @cells[4], @cells[2]],
      ]
      @rows.each do |row|
        if row.all? {|cell| cell == "O"}
          three_in_a_row = true
          break
        elsif row.all? {|cell| cell == "X"}
          three_in_a_row = true
          break
        else
          three_in_a_row = false
        end
      end
      return three_in_a_row
    end
  
    def next_turn(player)
      if winner?
        victory(player)
      end
      if full?
        end_game
      end
      player == @player1 ? play(@player2) : play(@player1)
    end
  
    def victory(player)
      puts "The winner is #{player.name}. Congratulations!"
      exit
    end
  
    def end_game
      puts "The board is full, and no one won. Sorry!"
      exit
    end
  end