require './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard
oystercard.touch_in("Brockley")
oystercard
oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
oystercard.top_up(1)
oystercard.touch_in("Brockley")
oystercard
oystercard.touch_out
oystercard
