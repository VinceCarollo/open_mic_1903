class OpenMic
  attr_reader :location, :date, :performers
  def initialize(club_stats)
    @location = club_stats[:location]
    @date = club_stats[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    all_joke_ids = []
    @performers.each do |performer|
      performer.jokes.each  do |joke|
         all_joke_ids << joke.id
       end
    end
    all_joke_ids.uniq != all_joke_ids
  end
end
