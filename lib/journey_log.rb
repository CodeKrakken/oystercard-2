class JourneyLog
  attr_reader :journeys
  attr_reader :current_journey
  attr_reader :journey

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    clear_current_journey
    @current_journey.start(station)
  end

  def finish(station)
    @current_journey.finish(station)
    @journey = @current_journey
    @journeys.push(@journey)
    clear_current_journey
  end

  def fare
    @journey.fare
  end

  def entry_station
    @current_journey.entry_station
  end

  def exit_station
    @current_journey.exit_station
  end

  def retrieve
    @journeys.dup
  end

  private

  def clear_current_journey
    @current_journey = @journey_class.new
  end

end