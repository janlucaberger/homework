FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octopus
  (0...FISHES.length - 1).each do |i|
    longest = true
    (0..FISHES.length - 1).each do |j|
      longest = false if fish[i].length < fish[j].length
    end
    if longest
      return FISHES[i]
    end
  end
end

def dominant_octopus(fishes)
  prc = Proc.new { |x, y| x <=> y}

  return fishes if fishes.length <= 1
  middle = fishes.length / 2

  left = dominant_octopus(fishes[0...middle])
  right = dominant_octopus(fishes[middle..-1])
  sorted = merge(left, right, prc)
  sorted.last
end

def merge(left, right, prc)
  merged = []
  until left.empty? || right.empty?
    if prc.call(left.first, right.first) == 1
      merged << right.shift
    else
      merged << left.shift
    end
  end
  merged + left + right
end


def clever_octopus
  longest_fish = ""
  FISHES.each do |fish|
    if fish.length > longest_fish.length
      longest_fish = fish
    end
  end
  longest_fish
end



def slowdance(dir, tiles)
  tiles.each_with_index do |tile, i|
    return i if dir == tile
  end
end

tile_hash = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fastdance(dir, tile_hash)
  tile_hash[dir]
end
