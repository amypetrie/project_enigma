require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require 'pry'
require 'date'

class EnigmaTest < Minitest::Test

  def test_enigma_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_enigma_has_character_map
    e = Enigma.new
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ",", "."], e.character_map
  end

  def test_encryption_works_on_four_plus_letter_message
    e = Enigma.new
    message = "sup world"
    assert_equal "afmhe.ovy", e.encrypt(message, "12345")
  end

  def test_encrypt_four_letter_msg
    e = Enigma.new
    msg = "sup "
    key = Key.new(12345)
    assert_equal "afmh", e.encrypt_four_letter_messages(msg.chars, Key.new(12345), Offset.new(Date.today))
  end

  def test_decrypt_four_letter_msg
    e = Enigma.new
    msg = "afmh"
    key = Key.new(12345)
    assert_equal "sup ", e.decrypt_four_letter_messages(msg.chars, Key.new(12345), Offset.new(Date.today))
  end

  def test_decryption_works
    e = Enigma.new
    encrypted = "afmhe.ovy"
    assert_equal "sup world", e.decrypt(encrypted, "12345")
  end

  def test_final_rotations
    e = Enigma.new
    k = Key.new("12345")
    o = Offset.new
    i = 10
    assert_equal 31, e.final_rotations(k, o, i)[:final_a]
  end
end
