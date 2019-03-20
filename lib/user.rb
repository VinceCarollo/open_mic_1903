class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    if !@jokes.include?(joke)
      @jokes << joke
    end
  end

  def tell(told_user, joke)
    if !told_user.jokes.include?(joke)
      told_user.jokes << joke
    end
  end

  def joke_by_id(id)
    @jokes.find{|joke| joke.id == id}
  end
end
