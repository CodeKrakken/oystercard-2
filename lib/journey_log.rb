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
    @journey = Journey.new unless @journey
    @journey.finish(station)
    @journeys.push(@journey)
  end

  def entry_station
    @journey.entry_station
  end

  def finish_station
    @journey.exit_station
  end

  def retrieve
    @journeys.dup
  end

end