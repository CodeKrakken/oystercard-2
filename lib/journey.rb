class Journey

  attr_reader :entry_station
  attr_reader :exit_station

  PENALTY_FARE = 6

  def initialize(station = nil)
    @entry_station = station
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare(entry_zone, exit_zone)
    PENALTY_FARE unless complete?
    (entry_zone.abs - exit_zone).abs + 1
  end

  def finish(station)
    @exit_station = station
    self
  end

end