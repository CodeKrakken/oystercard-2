class Journey

  attr_reader :entry_station

  PENALTY_FARE = 6

  def initialize(station)
    @entry_station = station
  end

  def complete?
  end

  def fare
    PENALTY_FARE
  end

  def finish(station)
    self
  end

end