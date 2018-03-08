class AttendancesController < ApplicationController
  before_action :logged_in_user

  def create
    @event = Event.find(params[:attended_id])
    current_user.attendances.create(attended_id: @event.id)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    @event = Attendance.find(params[:id]).attended
    current_user.attended_events.delete(@event)
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end
end
