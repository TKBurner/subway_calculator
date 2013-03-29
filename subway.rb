

class Subway
	attr_accessor :start_line, :start_stop, :end_line, :end_stop

	def initialize
		self.vroom
		self.get_choices
		self.calc_trip
	end

	def vroom
		@subway = {}
		@subway["n"] = ["TS", "34th", "28th", "23rd-N", "US", "8th"]
		@subway["l"] = ["8th", "6th", "US", "3rd", "1st"]
		@subway["6"] = ["GC", "33rd", "28th", "23rd-6", "US", "AP"]
	end

	def get_stops(line)
		@subway[line]
	end

	def get_choices
		puts "What train would you like to start your trip with? (l, n, or 6) > "
		self.start_line = gets.strip.chomp
		puts "What stop are you getting on at?"
		puts "Options are: "
		puts self.get_stops(self.start_line)
		self.start_stop = gets.strip.chomp
		puts "What train would you like to end your trip with? (l, n, or 6) > "
		self.end_line = gets.strip.chomp
		puts "What stop are you getting off at?"
		puts "Options are: "
		puts self.get_stops(self.end_line)
		self.end_stop = gets.strip.chomp
	end

	def calc_trip
		if start_line == end_line
			stops = ((@subway[start_line].index(start_stop))-(@subway[end_line].index(end_stop))).abs
			
		else
			stops = ((@subway[start_line].index(start_stop))-(@subway[start_line].index("US"))).abs + ((@subway[end_line].index("US"))-(@subway[end_line].index(end_stop))).abs 
		end
		puts "Your trip will take #{stops} stops"
	end

end


subway = Subway.new

