class RoomsController < ApplicationController
	def new
		@room = Room.new
	end

	def create
		Room.create(room_params)
	end


end
