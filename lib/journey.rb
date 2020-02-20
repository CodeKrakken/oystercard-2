class Journey

  PENALTY_FARE = 6

  attr_accessor :entry_station
  attr_reader :exit_station

  def initialize(station = nil)
    @entry_station = station
  end

  def start(station)
    @entry_station = station
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare
    complete? ? (entry_station.zone.abs - exit_station.zone).abs + 1 : PENALTY_FARE
  end

  def finish(station)
    @exit_station = station
    self
  end

end