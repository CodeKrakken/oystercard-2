require_relative 'station'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
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