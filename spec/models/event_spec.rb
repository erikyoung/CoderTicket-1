require 'rails_helper'

RSpec.describe Event, type: :model do

	describe 'upcoming events' do 
		it 'returns [] where there are no upcoming events' do
			expect(Event.upcoming).to eq []
		end

		it 'returns 1 event' do
			event = Event.new(starts_at: 1.day.from_now)
			event.save(validates: false)

			expect(Event.upcoming).to eq [event]
		end

		 it 'only returns upcoming events' do
		 	a = Event.new(starts_at: 2.days.ago)
		 	b = Event.new(starts_at: 1.day_from_now)
		 	c = Event.new(starts_at: Time.now + 2.months)

		 	[a,b,c].each { |event| event.save(validates: false)}

		 	expect(Event.upcoming.to match_array[b,c])
		end
	end
end
