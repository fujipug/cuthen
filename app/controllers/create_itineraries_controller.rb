class CreateItinerariesController < ApplicationController
	def new
		@itinerary = Itinerary.new
	end
	def create
		@itinerary = Itinerary.new(itinerary_params)
		if @itinerary.save
			redirect_to(:action => 'index')
		else
			#render('new')
		end
	end
	private
	def itinerary_params
		params.require(:itinerary).permit(:name, :user, :description, :start, :end)
	end
end