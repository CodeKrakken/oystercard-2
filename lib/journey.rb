class Journey

  attr_reader :entry_station
  attr_reader :exit_station

  PENALTY_FARE = 6

  def initialize(station = nil)
    @entry_station = station
  end

  def complete?
    !!@exit_station
  end

  def fare(entry_zone, exit_zone)
    PENALTY_FARE unless @entry_station && @exit_station
    return 1 if !!@entry_station && !!@exit_station
  end

  def finish(station)
    @exit_station = station
    self
  end

end