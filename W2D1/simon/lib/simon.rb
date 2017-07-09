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
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |el|
      sleep 0.5
      puts el
      sleep 1
      system('clear')
      sleep 1
    end

  end

  def require_sequence
    puts "Enter the sequence you just saw"
    @seq.each do |color|
      user_in = gets.chomp
      if color[0] != user_in
        @game_over = true
        break
      end
    end
    sleep 1
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
