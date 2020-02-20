class JourneyLog
  attr_reader :journeys

  def initialize(journey_class=nil)
    @journey = journey_class
    @journeys = []
  end

  def start(station)
    @journey.start(station)
  end

  def finish(station)
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
    @journeys.dup.each do |journey|
      return journey
    end
  end

  def complete?
    @journey.complete?
  end

end