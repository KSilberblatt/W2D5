class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    my_hash =""
    self.each { |el| my_hash += el.to_s.to_sym.object_id.hash.to_s }
    my_hash.to_sym.object_id.hash.to_i
    # my_hash = 0
    # self.each_with_index do |el, i|
    #   my_hash += el.hash * i
    # end
    # my_hash
  end
end

class String
  def hash
    self.to_sym.object_id.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.to_s.to_sym.object_id.hash
  end
end
