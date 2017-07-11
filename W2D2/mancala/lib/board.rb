class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    @cups.each_with_index do |arr, i|
      4.times do
        arr << :stone unless i == 6 || i == 13
      end
    end
  end

  def valid_move?(start_pos)
    raise ArgumentError.new("Invalid starting cup") if start_pos - 1 < 0 || start_pos - 1 > 13
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos]
    @cups[start_pos] = []

    i = start_pos
    until stone_count.empty?
      i += 1
      i = 0 if i > 13

      if i == 13
        @cups[13] << stone_count.pop if current_player_name == @name2
      elsif i == 6
        @cups[6] << stone_count.pop if current_player_name == @name1
      else
        @cups[i] << stone_count.pop
      end

    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side_one = @cups[0..5].all? { |el|  el.length == 0 }
    side_two =  @cups[7..12].all? { |el| el.length == 0}
    side_one == true || side_two == true ? true : false
  end

  def winner
    p1_score = @cups[6].count
    p2_score = @cups[13].count

    if p1_score == p2_score
      :draw
    else
      p1_score > p2_score ? @name1 : @name2
    end
  end
end
