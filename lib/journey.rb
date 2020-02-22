class Journey

  attr_reader :penalty_fare
  
  PENALTY_FARE = 6

  def initialize
    @penalty_fare = PENALTY_FARE
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    self
  end

  def entry_station
    @entry_station
  end

  def exit_station
    @exit_station
  end

  def complete?
    @entry_station.nil? == @exit_station.nil?
  end

  def fare
    complete? ? (entry_station.zone.abs - exit_station.zone).abs + 1 : PENALTY_FARE
  end

end