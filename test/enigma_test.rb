require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
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

  def test_encryption_works
    e = Enigma.new
    message = "hello world"
    assert_equal "", e.encrypt(message, "12345", Date.today)
  end
end
