class JourneyLog

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @finish_station = station
  end

  def entry_station
    @entry_station
  end

end