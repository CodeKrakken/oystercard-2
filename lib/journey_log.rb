class JourneyLog
  attr_reader :journeys

  def initialize
    @journeys = []
  end

  def start(station)
    @journey = Journey.new(station)
    @journey.entry_station
  end

  def finish(station)
    @finish_station = station
  end

  def entry_station
    @journey.entry_station
  end

  def finish_station
    @finish_station
  end

end