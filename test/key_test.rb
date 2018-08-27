require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def test_key_exists
    key = Key.new("12345")
    assert_instance_of Key, key
  end

  def test_key_has_key_numbers_incl_random_generation
    key_1 = Key.new("12345")
    assert_equal "12345", key_1.key_numbers
    key_2 = Key.new
    assert_equal 5, key_2.key_numbers.length
  end

  def test_rotation_a_adds_and_converts_to_integer
    key = Key.new("12345")
    assert_equal 12, key.rotation_a
  end

  def test_rotation_b_adds_and_converts_to_integer
    key = Key.new("12345")
    assert_equal 23, key.rotation_b
  end


  def test_rotation_c_adds_and_converts_to_integer
    key = Key.new("12345")
    assert_equal 34, key.rotation_c
  end

  def test_rotation_d_adds_and_converts_to_integer
    key = Key.new("12345")
    assert_equal 45, key.rotation_d
  end

end
