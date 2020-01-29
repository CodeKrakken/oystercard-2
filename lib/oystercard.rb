class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance
  attr_reader :entry_station

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    fail "Insufficient funds to touch in" if balance < MINIMUM_BALANCE
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_BALANCE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end