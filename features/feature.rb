require './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.balance
oystercard.top_up(10)
oystercard.top_up(81)
oystercard.top_up(80)
oystercard.deduct(5)
oystercard.in_journey?
oystercard.touch_in
oystercard.in_journey?
oystercard.touch_out
oystercard.in_journey?