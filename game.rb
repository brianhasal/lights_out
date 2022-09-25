require 'io/console' 


class Game
  attr_reader :grid

  def initialize
    @grid = [
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ]

    randomize_grid
  end


  def enter_next_round
    puts "Press any key to continue: "
    STDIN.getch
  end

  def print_grid
    ### Modified to add borders
    i = 1
    puts ""
    puts "   1 2 3 4 5 "
    puts
    @grid.each do |row|
      puts "-" * 14
      print "#{i} "
      i += 1
      print "|"
      row.each do |space|
        if space == 0
          print " |"
        elsif space == 1
          print "X|"
        end
      end
      puts
    end
    puts "-" * 14
  end

  def randomize_grid
    # Your job is to fill this in!
    @grid = []
    5.times do 
      row = 5.times.map{Random.rand(0..1) }
      @grid << row
    end
    return @grid
  end

  def choose_space(row_number, column_number)
    # Your job is to fill this in!
    def flipper(input)
      if input == 0
        input = 1
      else
        input = 0
      end
      input
    end
  
  
    chosen = @grid[row_number][column_number]
    chosen = flipper(chosen)
    @grid[row_number][column_number] = chosen
  
    if row_number > 0
      n = @grid[row_number - 1][column_number]
      n = flipper(n) 
      @grid[row_number - 1][column_number] = n
    end
  
    if row_number < (@grid.length - 1)
      s = @grid[row_number + 1][column_number]
      s = flipper(s)
      @grid[row_number + 1][column_number] = s
    end 
  
    if column_number >= 1
      w = @grid[row_number][column_number - 1]
      w = flipper(w)
      @grid[row_number][column_number - 1] = w
    end
  
    if column_number < @grid[0].length - 1
      e = @grid[row_number][column_number + 1]
      e = flipper(e)
      @grid[row_number][column_number + 1] = e
    end
  
    return @grid
  
  end

  def won?
    # Your job is to fill this in!
    won = false
    if @grid == [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
      p "You win!"
      won = true
    end
    return won
  end

end

