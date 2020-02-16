require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance
  attr_reader :journey_log

  def initialize(journey_log_class)
    @balance = 0
    @journey_log = journey_log_class
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds to touch in" if balance < MINIMUM_BALANCE
    station
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end