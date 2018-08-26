require 'pry'
require 'date'

class Key

    attr_reader :key_numbers

  def initialize(key_numbers = rand(10_000..99_999).to_s)
  @key_numbers = key_numbers
  end

  def rotation_a
    to_array[0..1].join.to_i
  end

  def rotation_b
    to_array[1..2].join.to_i
  end

  def rotation_c
    to_array[2..3].join.to_i
  end

  def rotation_d
    to_array[3..4].join.to_i
  end

  def to_array
  @key_numbers = key_numbers.chars
  end

end
