require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  attr_reader :sal,  :ali, :joke_1, :joke_2

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_it_exists
    assert_instance_of User, sal
  end

  def test_it_has_attributes
    assert_equal 'Sal', sal.name
    assert_equal [], sal.jokes
  end

  def test_it_can_learn_jokes
    sal.learn(joke_1)
    sal.learn(joke_2)
    assert_equal [joke_1, joke_2], sal.jokes
  end

  def test_it_can_pass_jokes_to_other_users_by_telling_them
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)
    assert_equal [joke_1, joke_2], ali.jokes
    assert_equal joke_1, ali.joke_by_id(1)
    assert_equal joke_2, ali.joke_by_id(2)
  end

  def test_it_cant_learn_or_be_told_the_same_joke_twice
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.learn(joke_2)
    ali.tell(sal, joke_2)
    assert_equal [joke_1, joke_2], sal.jokes
  end
end
