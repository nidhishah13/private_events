class EventsController < ApplicationController
	before_action :logged_in_user, only: [ :new, :create, :destroy]

	def index
		@events = Event.all
	end

	def show 
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to current_user 
		else
			flash[:danger] = "event not created"
			redirect_to current_user
		end
	end	

	def destroy
	end

	private

		def event_params
			params.require(:event).permit(:title, :description, :event_date, :user_id)
		end
end
