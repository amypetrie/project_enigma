require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require 'pry'

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

  def test_decryption_works
    e = Enigma.new
    encrypted = "afmhe.ovy"
    assert_equal "sup world", e.decrypt(encrypted, "12345")
  end

  def test_final_rotation_a
    e = Enigma.new
    o = Offset.new
    k = Key.new("12345")
    assert_equal 21, e.final_rotation_a(k, o)
  end

  def test_final_rotation_b
    e = Enigma.new
    o = Offset.new
    k = Key.new("12345")
    assert_equal 24, e.final_rotation_b(k, o)
  end

  def test_final_rotation_c
    e = Enigma.new
    o = Offset.new
    k = Key.new("12345")
    assert_equal 36, e.final_rotation_c(k, o)
  end

  def test_final_rotation_d
    e = Enigma.new
    o = Offset.new
    k = Key.new("12345")
    assert_equal 10, e.final_rotation_d(k, o)
  end

end
