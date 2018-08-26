require 'pry'
require 'date'

class Enigma

  attr_reader :character_map

  def initialize
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ",", "."]
  end

  # def encrypt(my_message, key = Key.new, date = Date.today)
  #   ma = my_message.chars.each_slice(4).to_a
  #   ma.map do |array|
  #       array[0] = @character_map[final_rotation_a]
  #       array[1] = @character_map[final_rotation_b]
  #       array[2] = @character_map[final_rotation_c]
  #       array[3] = @character_map[final_rotation_d]
  #   end
  # end

  def final_rotation_a(key, offset)
    final_a = key.rotation_a + offset.offset_rotation_a
    final = final_a % 39
  end

  def final_rotation_b(key, offset)
    final_b = key.rotation_b + offset.offset_rotation_b
    final = final_b % 39
  end

  def final_rotation_c(key, offset)
    final_c = key.rotation_c + offset.offset_rotation_c
    final = final_c % 39
  end

  def final_rotation_d(key, offset)
    final_d = key.rotation_d + offset.offset_rotation_d
    final = final_d % 39
  end

end
