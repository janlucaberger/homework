class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    add_random_color
  end

  def show_sequence
    add_random_color
    @seq.each do |el|
      puts el
      sleep 1
      system('clear')
    end
  end

  def require_sequence
    puts "Enter the sequence you just saw"
    color = gets.chomp
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You got it! Time for the next round"
  end

  def game_over_message
    puts "Sorry you lose!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
