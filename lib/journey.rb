class Journey

  attr_reader :entry_station
  attr_reader :exit_station

  def initialize(station = nil)
    @entry_station = station
  end

  def complete?
    @entry_station && @exit_station
  end

  def finish(station)
    @exit_station = station
    self
  end

end