class Player
    attr_reader :name, :symbol
  
    def initialize
      if defined?(@@number_of_players)
        @@number_of_players += 1
      else
        @@number_of_players = 1
      end
      get_name
      assign_symbol
    end
  
    private
  
    def get_name
      if @@number_of_players == 1
        puts "Enter first player name:"
        @name = gets.chomp.capitalize
        while @name.empty?
          puts "You didn't enter a name. Try again:"
          @name = gets.chomp.capitalize
        end
        @@p1_name = @name
      else
        puts "Enter second player name:"
        @name = gets.chomp.capitalize
        while @name.empty? or @name == @@p1_name
          puts "You didn't enter a name, or that name is already taken. Try again:"
          @name = gets.chomp.capitalize
        end
      end
    end
  
    def assign_symbol
      if @@number_of_players == 1
        print "Would you like to play O or X? "
        @symbol = gets.chomp.upcase
        while not (["O","X"].include? @symbol)
          puts "Please choose O or X."
          @symbol = gets.chomp.upcase
        end
        @@p1_symbol = @symbol
      else
        @@p1_symbol == "O" ? @symbol = "X" : @symbol = "O"
      end
    end
  end