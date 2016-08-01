HashEntry = Struct.new(:key, :value)

class HashTable < Array

  GROWTH_FACTOR = 2

  attr_accessor :bigness

  def hash(key)
    key.hash % bigness
  end

  def bigness
    @bigness ||= 5
  end

  def [](key)
    index = hash(key)
    junk = self.at(index)
    junk.last if junk
  end

  def store(key, value)
    resize while collides?(key)
    index = hash(key)

    self.insert(index, [key, value])
    self.delete_at(index.next)
    value
  end

  def collides?(key)
    self[key] && self.at(hash(key)).first != key
  end

  def resize
    blergh = self.compact
    self.bigness *= GROWTH_FACTOR
    self.clear
    blergh.each { |k, v| store(k,v) }
    blergh.clear
  end
end
