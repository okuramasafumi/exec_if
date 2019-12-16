require "test_helper"
require 'exec_if'

class ExecIfTest < Minitest::Test
  def setup
    @object = 'foobar'
  end

  def test_that_it_has_a_version_number
    refute_nil ::ExecIf::VERSION
  end

  def test_it_raises_exception_without_argument
    assert_raises ArgumentError do
      @object.exec_if { puts 'This should never be put' }
    end
  end

  def test_it_does_not_execute_block_and_returns_self_if_argument_is_nil
    assert_output("") do
      @result = @object.exec_if(nil) { puts 'This should never be put' }
    end
    assert_equal @result, @object
  end

  def test_it_does_not_execute_block_and_returns_self_if_argument_is_false
    assert_output "" do
      @return = @object.exec_if(false) { print 'This should never be put' }
    end
    assert_equal @object, @return
  end

  def test_it_executes_block_if_argument_is_a_proc_and_result_of_calling_is_truthy
    assert_output "foo" do
      @result = @object.exec_if(Proc.new {|obj| obj.is_a?(String) }) { print 'foo'; 42 }
    end
    assert_equal 42, @result
  end

  def test_it_does_not_execute_block_and_return_self_if_argument_is_a_proc_and_result_of_calling_is_falsy
    assert_output "" do
      @return = @object.exec_if(Proc.new {|obj| obj.is_a?(Integer) }) { print 'foo' }
    end
    assert_equal @object, @return
  end

  def test_it_executes_block_if_argument_is_a_symbol_and_result_of_method_named_as_symbol_is_truthy
    assert_output "foo" do
      @return = @object.exec_if(:ascii_only?) { print 'foo'; 'foo' }
    end
    assert_equal 'foo', @return
  end

  def test_it_does_not_execute_block_and_return_self_if_argument_is_symbol_and_result_of_method_named_as_symbol_is_falsy
    assert_output "" do
      @return = @object.exec_if(:empty?) { print 'foo' }
    end
    assert_equal @object, @return
  end

  def test_it_executes_block_if_argument_is_a_string_and_result_of_eval_is_truthy
    assert_output "foo" do
      @return = @object.exec_if('42.is_a?(Integer)') { print 'foo'; 'foo' }
    end
    assert_equal 'foo', @return
  end

  def test_it_does_not_execute_block_and_returns_self_if_argument_is_a_string_and_result_of_eval_is_falsy
    assert_output "" do
      @return = @object.exec_if('42.is_a?(String)') { print 'foo'; 'foo' }
    end
    assert_equal @object, @return
  end

  def test_it_executes_block_with_self_and_argument
    assert_output "foobar: 1" do
      @object.exec_if(1) {|obj, i| print "#{obj}: #{i}"}
    end
  end
end
