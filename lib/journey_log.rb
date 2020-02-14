class JourneyLog
  attr_reader :journeys

  def initialize(journey_class=nil)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journey_class.start(station)
  end

  def finish(station)
    @journey_class.finish(station)
    @journeys.push(@journey_class)
  end

  def entry_station
    @journey_class.entry_station
  end

  def finish_station
    @journey_class.exit_station
  end

  def retrieve
    @journeys.dup.each do |journey|
      return journey
    end
  end
end