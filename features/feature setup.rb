require './lib/oystercard.rb'
require './lib/station'
require './lib/journey'
require './lib/journey_log'
oystercard = Oystercard.new(JourneyLog, Journey)
brockley = Station.new('Brockley', 2)
oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
