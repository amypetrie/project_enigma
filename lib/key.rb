require 'pry'
require 'date'

class Key
    attr_reader :key_numbers
  def initialize(key_numbers)
  @key_numbers = key_numbers
  end

  def rotation_a
  end

  def rotation_b
  end

  def rotation_c
  end

  def rotation_d
  end

  def to_array
  @key_numbers = key_numbers.chars
  end

end
