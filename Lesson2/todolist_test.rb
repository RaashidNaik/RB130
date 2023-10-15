require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require 'simplecov'
SimpleCov.start

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_typerror_when_add
    assert_raises(TypeError) { @list.add("String Object") }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shift_symbol
    todo4 = Todo.new("New")
    @list << todo4
    assert_equal([@todo1, @todo2, @todo3, todo4], @list.to_a)
  end

  def test_typererror_when_shift
    assert_raises(TypeError) { @list << "String Object" }
    assert_raises(TypeError) { @list << 1 }
  end

  def test_add
    todo4 = Todo.new("New")
    @list.add(todo4)
    assert_equal([@todo1, @todo2, @todo3, todo4], @list.to_a)
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done)
    assert_equal(false, @todo2.done)
    assert_equal(false, @todo3.done)
    assert_raises(IndexError) { @list.mark_done_at(5) }
  end

  def test_mark_undone_at
    @todo1.done = true
    @todo2.done = true
    @todo3.done = true
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done)
    assert_equal(false, @todo2.done)
    assert_equal(true, @todo3.done)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done)
    assert_equal(true, @todo2.done)
    assert_equal(true, @todo3.done)
  end

  def test_remove_at
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(100) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_done
    @list.mark_done_at(1)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_todos_done
    @list.done!

     output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |todo| todo.done! }
    assert_equal(true, @list.done?)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    @list.each { |todo| puts todo }
    OUTPUT
    assert(output, @list.to_s)
  end

  def test_each_return_value
    assert_equal(@list, @list.each { |todo| nil})
  end

  def test_select
    @todo1.done!
    @todo2.done!
    assert_equal([@todo1, @todo2], @list.select { |todo| todo.done? }.todos)
  end

end