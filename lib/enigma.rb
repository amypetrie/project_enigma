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
    message = message.chars
    encrypted = []
    loop do
      break if message.length == 0
      four_letter_msg = message.first(4)
      value = encrypt_four_letter_messages(four_letter_msg, key, offset)
      encrypted << value
      message = message.drop(4)
    end
    encrypted.join("")
  end

  def encrypt_four_letter_messages(msg, key, offset)
    mapped = msg.map.with_index do |char, index|
    char_index = @character_map.rindex(char)
      if index == 0
        char = @character_map[final_rotations(key, offset, char_index)[:final_a]]
      elsif index == 1
        char = @character_map[final_rotations(key, offset, char_index)[:final_b]]
      elsif index == 2
        char = @character_map[final_rotations(key, offset, char_index)[:final_c]]
      else
        char = @character_map[final_rotations(key, offset, char_index)[:final_d]]
      end
    end
    mapped.join("")
  end

  def decrypt(encrypted_msg, msg_key, date = Date.today)
    offset = Offset.new(date)
    key = Key.new(msg_key)
    message = encrypted_msg.chars
    decrypted = []
    loop do
      break if message.length == 0
      four_letter_msg = message.first(4)
      value = decrypt_four_letter_messages(four_letter_msg, key, offset)
      decrypted << value
      message = message.drop(4)
    end
    decrypted.join("")
  end

  def decrypt_four_letter_messages(msg, key, offset)
    mapped = msg.map.with_index do |char, index|
    char_index = @character_map.rindex(char)
      if index == 0
        char = @character_map[final_decrypted_rotations(key, offset, char_index)[:final_a]]
      elsif index == 1
        char = @character_map[final_decrypted_rotations(key, offset, char_index)[:final_b]]
      elsif index == 2
        char = @character_map[final_decrypted_rotations(key, offset, char_index)[:final_c]]
      else
        char = @character_map[final_decrypted_rotations(key, offset, char_index)[:final_d]]
      end
    end
    mapped.join("")
  end

  def final_rotations(key, offset, char_index)
    {
      :final_a => ((char_index + key.rotation_a + offset.offset_rotation_a) % 39),
      :final_b => ((char_index + key.rotation_b + offset.offset_rotation_b) % 39),
      :final_c => ((char_index + key.rotation_c + offset.offset_rotation_c) % 39),
      :final_d => ((char_index + key.rotation_d + offset.offset_rotation_d) % 39)
    }
  end

  def final_decrypted_rotations(key, offset, char_index)
    {
      :final_a => ((char_index - (key.rotation_a + offset.offset_rotation_a)) % 39),
      :final_b => ((char_index - (key.rotation_b + offset.offset_rotation_b)) % 39),
      :final_c => ((char_index - (key.rotation_c + offset.offset_rotation_c)) % 39),
      :final_d => ((char_index - (key.rotation_d + offset.offset_rotation_d)) % 39)
    }
  end
end

# CRACK
# def find_key(encrypted_msg, date = Date.today)
#   offset = Offset.new(date)
#   message = encrypted_msg.chars
#   loop do
#   break if message.length == 0
#     four_letter_msg = message.first(4)
#     @encrypted << four_letter_msg.map do |char|
#       index_integer = @character_map.rindex(char)
#       if four_letter_msg.rindex(char) == 0
#         char = @character_map[(index_integer.to_i + final_rotation_a(key, offset)) % 39]
#       elsif four_letter_msg.rindex(char) == 1
#         char = @character_map[(index_integer + final_rotation_b(key, offset)) % 39]
#       elsif four_letter_msg.rindex(char) == 2
#         char = @character_map[(index_integer + final_rotation_c(key, offset)) % 39]
#       else
#         char = @character_map[(index_integer + final_rotation_d(key, offset)) % 39]
#       end
#     end
#     message = message.drop(4)
#   end
# end
