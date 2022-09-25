require_relative "game.rb"
require 'io/console' 

game = Game.new


puts "Welcome to Lights Out!"
game.enter_next_round
game.print_grid
while game.won? == false
  
  input_test = false
  while input_test == false
    print "Enter a row number: "
    row = gets.chomp.to_i - 1
    if row > -1
      input_test = true
    end
  end

  input_test = false
  while input_test == false
    print "Enter a column number: "
    column = gets.chomp.to_i - 1
    if column > -1
      input_test = true
    end
  end

  game.choose_space(row, column)
  game.print_grid
end

