require 'pry'
require 'date'

class Offset

  attr_reader :date

  def initialize(date = Date.today)
    @date = date
  end

  def adjust_date_to_day
    day = @date.to_s[-2..-1]
  end

  def adjust_date_to_month
    month = @date.to_s[5..6]
  end

  def adjust_date_to_year
    year = @date.to_s[2..3]
  end

  def final_date_offset
    final = adjust_date_to_day + adjust_date_to_month + adjust_date_to_year
    final.to_i
  end

  def squared_final_date_offset
    final_date_offset ** 2
  end

  def offset_rotation_a
    array = squared_final_date_offset.to_s.split("")
    array[-4].to_i
  end

  def offset_rotation_b
    array = squared_final_date_offset.to_s.split("")
    array[-3].to_i
  end

  def offset_rotation_c
    array = squared_final_date_offset.to_s.split("")
    array[-2].to_i
  end

  def offset_rotation_d
    array = squared_final_date_offset.to_s.split("")
    array[-1].to_i
  end
end
