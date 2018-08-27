require 'pry'
require 'date'

class Key

  attr_reader :key_numbers

  def initialize(key_numbers = rand(10_000..99_999).to_s)
  @key_numbers = key_numbers
  end

  def rotation_a
    @key_numbers.chars[0..1].join.to_i
  end

  def rotation_b
    @key_numbers.chars[1..2].join.to_i
  end

  def rotation_c
    @key_numbers.chars[2..3].join.to_i
  end

  def rotation_d
    @key_numbers.chars[3..4].join.to_i
  end

end
