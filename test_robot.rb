require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    r2d2 = Robot.new
    r2d2.foreign_model = true
    r2d2.needs_repairs = true
    # act
    result = r2d2.station
    # assert
    assert_equal(1, result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    megazord = Robot.new
    megazord.vintage_model = true
    megazord.needs_repairs = true

    result = megazord.station

    assert_equal(2, result)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    bender = Robot.new
    bender.needs_repairs = true

    result = bender.station

    assert_equal(3, result)

  end

  def test_that_robot_in_good_condition_sent_to_station_4

    terminator = Robot.new

    result = terminator.station

    assert_equal(4, result)

  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    iron_giant = Robot.new
    iron_giant.todos = []

    result = iron_giant.prioritize_tasks

    assert_equal(-1, result)

  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    johnny5 = Robot.new
    johnny5.todos = [1, 2, 5]

    result = johnny5.prioritize_tasks

    assert_equal(5, result)

  end

  def test_workday_on_day_off_returns_false

    crow = Robot.new
    crow.day_off = "Saturday"

    result = crow.workday?("Saturday")

    assert_equal(false, result)

  end

  def test_workday_not_day_off_returns_true

    servo = Robot.new
    servo.day_off = "Saturday"

    result = servo.workday?("Friday")

    assert_equal(true, result)

  end

end
