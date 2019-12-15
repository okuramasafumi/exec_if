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

  def test_it_executes_block_if_argument_is_truthy
    assert_output "foo" do
      @object.exec_if(true) { print 'foo' }
    end
  end

  def test_it_executes_block_with_self_and_argument
    assert_output "foobar: 1" do
      @object.exec_if(1) {|obj, i| print "#{obj}: #{i}"}
    end
  end

  def test_it_returns_self_if_argument_is_falsy
    assert_output "" do
      @object.exec_if(false) { print 'This should never be put' }
    end
  end
end
