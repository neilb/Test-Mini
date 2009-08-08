use Mini::Unit;

# Classic-style Example
# Test case class extends Mini::Unit::TestCase
class ClassicTest extends Mini::Unit::TestCase
{
  # Only methods matching /^test.+/ will automatically run.
  method test_do_nothing() { }

  # Pre- and post- actions can be described by declaring the relevant methods.
  # Avoiding the latter two is recommended, but they are provided for those
  # interested in them.
  method setup()    { 'This runs before each test...' }
  method teardown() { 'This runs after each test...' }

  # Assertion methods are not automatically in scope, but do reside on $self.
  method test_assert() { $self->assert(1, 'I should pass') }
  method test_refute() { $self->refute(0, 'I should fail') }
  method test_skip()   { $self->skip("I've got better things to do") }

  # Assertion methods can be included from Mini::Unit::Assertions.
  use Mini::Unit::Assertions;
  method test_local_assert() { assert 1, 'I should pass' }
  method test_local_refute() { refute 0, 'I should fail' }
  method test_local_skip()   { skip "I've got better things to do" }
}

# Sugary Example
# Mini::Unit also declares the 'testcase' keyword for you, which provides a
# class definition that automatically includes the basic assertions.
testcase Foo
{
  method test_passes() { assert 1, 'I should pass' }
  method test_refute() { refute 0, 'I should fail' }
  method test_skip()   { skip "I've got better things to do" }

  # In addition, a 'testcase'-declared class allows you to declare tests with
  # the 'test' keyword.
  test keyword_passes { assert 1, 'I should pass' }
  test keyword_refute { refute 0, 'I should fail' }
  test keyword_skip   { skip "I've got better things to do" }

  # Pre- and post- actions can be declared with the 'setup' and 'teardown'
  # keywords; multiple invocations will execute in order of declaration.
  setup    { 'This runs before each test...' }
  teardown { 'This runs after each test...' }
}