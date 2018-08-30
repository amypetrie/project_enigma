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

  def find_key_rotations(encrypted_msg, date = Date.today)
    offset = Offset.new(date)
    known = "..end..".chars
    last_numbers = encrypted_msg.length % 4
     start_index = -(last_numbers + 4)
     msg = encrypted_msg.chars.slice(start_index, 4)
     mapped = msg.map.with_index do |encrypted_char, index|
       encrypted_char_index = @character_map.rindex(encrypted_char)
       if index == 0
         key_rotation_a = encrypted_char_index - @character_map.rindex(known[start_index]) - offset.offset_rotation_a
         key_rotation_a % 39
       elsif index == 1
         key_rotation_b = encrypted_char_index - @character_map.rindex(known[start_index + 1]) - offset.offset_rotation_b
         key_rotation_b % 39
       elsif index == 2
         key_rotation_c = encrypted_char_index - @character_map.rindex(known[start_index + 2]) - offset.offset_rotation_c
         key_rotation_c % 39
       elsif index == 3
         key_rotation_d = encrypted_char_index - @character_map.rindex(known[start_index + 3]) - offset.offset_rotation_d
         key_rotation_d % 39

       end
      end
     mapped
  end

   def find_key
   end

   def crack_message(msg, date)
     key = find_key
     decrypt(msg, key, date)
   end
end
