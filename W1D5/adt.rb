class Stack
  def initialize
    @cont = []
  end

  def add(el)
    @cont << el
  end

  def remove
    @cont.pop
  end

  def show
    @cont
  end
end


class Queue

  def initialize
    @cont = []
  end

  def enqueue(el)
    @cont << el
  end

  def dequeue
    @cont.shift
  end

  def show
    @cont
  end

end


class Map

  def initialize
    @cont = []
  end

  def assign(key, value)
    pair_idx = find_idx(key)
    pair_idx ? @cont[pair_idx][1] = value : @cont << [key, value]
  end

  def find_idx(key)
    @cont.each_with_index do |pair, i|
      return i if pair.first == key
    end
    false
  end

  def lookup(key)
    idx = find_idx(key)
    idx == false ? false : @cont[idx].last
  end

  def remove(key)
    pair_idx = find_idx(key)
    @cont.delete_at(pair_idx)
  end

  def show
    @cont
  end

end
