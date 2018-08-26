require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  def test_offset_exists
    o = Offset.new
    assert_instance_of Offset, o
  end

  def test_it_coverts_date_to_day
    o = Offset.new
    assert_equal "26", o.adjust_date_to_day
  end

  def test_it_coverts_date_to_month
    o = Offset.new
    assert_equal "08", o.adjust_date_to_month
  end

  def test_it_coverts_date_to_year
    o = Offset.new
    assert_equal "18", o.adjust_date_to_year
  end

  def test_final_date_offset
    o = Offset.new
    assert_equal 260818, o.final_date_offset
  end

  def test_it_squares_date
    o = Offset.new
    assert_equal 68026029124, o.squared_final_date_offset
  end

  def test_offset_rotation_a
    o = Offset.new
    assert_equal 9, o.offset_rotation_a
  end

  def test_offset_rotation_b
    o = Offset.new
    assert_equal 1, o.offset_rotation_b
  end

  def test_offset_rotation_c
    o = Offset.new
    assert_equal 2, o.offset_rotation_c
  end

  def test_offset_rotation_d
    o = Offset.new
    assert_equal 4, o.offset_rotation_d
  end
end
