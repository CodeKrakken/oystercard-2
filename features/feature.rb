require './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.balance
oystercard.in_journey?
oystercard.touch_in
oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
oystercard.top_up(1)
oystercard.deduct(5)
oystercard.touch_in
oystercard.in_journey?
oystercard.touch_out
oystercard.in_journey?