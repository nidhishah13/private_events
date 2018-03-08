class EventsController < ApplicationController
	before_action :logged_in_user, only: [ :new, :create, :destroy]

	def index
		@events = Event.all
		@upcoming_events = @events.upcoming
		@past_events = @events.past
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

	def edit
    @event = Event.find(params[:id]) 
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event details updated"
      redirect_to @event
      # Handle a successful update.
    else
      render 'edit'
    end
  end

	def destroy
		#@event.destroy
		Event.find(params[:id]).destroy
		flash[:success] = "Event deleted"
		redirect_to root_url
	end

	private

		def event_params
			params.require(:event).permit(:title, :description, :event_date, :user_id)
		end

end
