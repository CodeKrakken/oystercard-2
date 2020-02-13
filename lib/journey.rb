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

  def fare
    return 1 if !!@entry_station && !!@exit_station
    PENALTY_FARE
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    self
  end

end