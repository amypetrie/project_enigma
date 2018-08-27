require 'pry'
require 'date'

class Enigma

  attr_reader :character_map

  def initialize
    @character_map = ("a".."z").to_a + ("0".."9").to_a + ([" ", ",", "."])
  end

  def encrypt(message, msg_key = Key.new, date = Date.today)
    offset = Offset.new(date)
    key = Key.new(msg_key)
    output = []
    message.chars.each_slice(4) do |four_char_array|
      output << four_char_array[0] = @character_map[final_rotation_a(key, offset)]
      output << four_char_array[1] = @character_map[final_rotation_b(key, offset)]
      output << four_char_array[2] = @character_map[final_rotation_c(key, offset)]
      output << four_char_array[3] = @character_map[final_rotation_d(key, offset)]
    end
    output.join("")
  end

  def final_rotation_d(key, offset)
    # final_d =
    key.rotation_d + offset.offset_rotation_d  % 39
    # final_d
  end

  def final_rotation_a(key, offset)
    final_a = key.rotation_a + offset.offset_rotation_a
    final_a % 39
  end

  def final_rotation_b(key, offset)
    final_b = key.rotation_b + offset.offset_rotation_b
    final_b % 39
  end

  def final_rotation_c(key, offset)
    final_c = key.rotation_c + offset.offset_rotation_c
    final_c % 39
  end
end
