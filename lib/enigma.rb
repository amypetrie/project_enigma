require 'pry'
require 'date'

class Enigma

  attr_reader :character_map, :output

  def initialize
    @character_map = ("a".."z").to_a + ("0".."9").to_a + ([" ", ",", "."])
    @output = []
  end

  def encrypt(message, msg_key = Key.new, date = Date.today)
    offset = Offset.new(date)
    key = Key.new(msg_key)
    message = message.chars
    loop do
    break if message.length == 0
      four_letter_msg = message.first(4)
      @output << four_letter_msg.map do |char|
        index_integer = @character_map.rindex(char)
        if four_letter_msg.rindex(char) == 0
          char = @character_map[(index_integer.to_i + final_rotation_a(key, offset)) % 39]
        elsif four_letter_msg.rindex(char) == 1
          char = @character_map[(index_integer + final_rotation_b(key, offset)) % 39]
        elsif four_letter_msg.rindex(char) == 2
          char = @character_map[(index_integer + final_rotation_c(key, offset)) % 39]
        else
          char = @character_map[(index_integer + final_rotation_d(key, offset)) % 39]
        end
      end
      message = message.drop(4)
    end
    @output.join("")
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

  def final_rotation_d(key, offset)
    final_d = key.rotation_d + offset.offset_rotation_d
    final_d % 39
  end
end
