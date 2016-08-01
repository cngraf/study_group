class Bubbler

  attr_accessor :array

  def self.sort(array)
    self.new(array).sort
  end

  def initialize(array)
    @array = array
  end

  def sort
    p array
    counter = array.length - 1
    until counter == 0 || sorted?
      bubble(counter)
      counter -= 1
    end
    p array
    array
  end

  def bubble(n)
    i = 0
    n.times do
      if array[i] > array[i+1]
        swap(i, i+1)
      end
      i += 1
    end
  end

  def swap(a, b)
    item_b = array[b]
    array[b] = array[a]
    array[a] = item_b
  end

  def sorted?
    (array.length - 1).times do |i|
      return false if array[i] > array[i+1]
    end
    return true
  end
end

test_ary = [4, 1, 7, 3, 6, 2, 5]
Bubbler.sort(test_ary)
