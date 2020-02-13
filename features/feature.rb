require './lib/oystercard.rb'
oystercard = Oystercard.new
station = Station.new('Brockley', 2)
oystercard
station
oystercard.touch_in(station)
oystercard
oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
oystercard.top_up(1)
oystercard.touch_in(station)
oystercard
oystercard.touch_out('Shoreditch High St')
oystercard
