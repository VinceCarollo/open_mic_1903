class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(told_user, joke)
    told_user.jokes << joke
  end

  def joke_by_id(id)
    @jokes.find{|joke| joke.id == id}
  end
end
