require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'
require 'pry'

class OpenMicTest < Minitest::Test
  attr_reader :open_mic,
              :sal,
              :ali,
              :joke_1,
              :joke_2,
              :joke_3

  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @joke_3 = Joke.new(3, "Did you hear about the semi-colon that broke the law?", "He was given two consecutive sentences.")
  end

  def test_it_exists
    assert_instance_of OpenMic, open_mic
  end

  def test_it_has_attributes
    assert_equal "Comedy Works", open_mic.location
    assert_equal "11-20-18", open_mic.date
  end

  def test_it_starts_without_any_performers
    assert_equal [], open_mic.performers
  end

  def test_it_can_welcome_performers
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    assert_equal [sal, ali], open_mic.performers
  end

  def test_it_can_tell_if_performers_have_the_same_jokes
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    ali.learn(joke_1)
    ali.learn(joke_2)
    refute open_mic.repeated_jokes?

    ali.tell(sal, joke_1)
    assert open_mic.repeated_jokes?
  end

  def test_it_can_tell_if_performers_have_the_same_jokes_when_told_or_learned_out_of_order
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    ali.learn(joke_2)
    ali.learn(joke_1)
    sal.learn(joke_3)
    refute open_mic.repeated_jokes?

    ali.tell(sal, joke_2)
    assert open_mic.repeated_jokes?
  end
end
