require './lib/oystercard.rb'
require './lib/station'
require './lib/journey'
require './lib/journey_log'
oystercard = Oystercard.new(JourneyLog, Journey)
brockley = Station.new('Brockley', 2)
shoreditch = Station.new('Shoreditch', 2)
anerley = Station.new('Anerley', 4)
oystercard
brockley
shoreditch
anerley
oystercard.touch_in(brockley)
oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
oystercard.balance
oystercard.top_up(1)
oystercard.touch_in(brockley)
oystercard.touch_out(shoreditch)
oystercard.touch_in(shoreditch)
oystercard.touch_out(anerley)
oystercard.journey_log.current_journey
oystercard.touch_out(brockley)
oystercard.journey_log.retrieve