class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance
  attr_reader :journey_log

  def initialize(journey_log_class, journey_class)
    @balance = 0
    @journey_class = journey_class
    @journey_log = journey_log_class.new(journey_class)
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds to touch in" if balance < MINIMUM_BALANCE
    deduct(@journey_class::PENALTY_FARE) if (@journey_log.current_journey && !@journey_log.current_journey.complete?)
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.fare)
  end

  def deduct(amount)
    @balance -= amount
  end

end