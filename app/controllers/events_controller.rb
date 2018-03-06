class EventsController < ApplicationController

  def index
    @events = Event.all
    @weekdays = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
    # byebug
  end


  # def show
  #   @event = Event.find(params[:id])
  # end
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
	# check for existing events
	# maybe there is a way to do that with validation
	if @event.valid?
      	@event.save
      	flash[:notice] = 'Event was successfully created.'
      	redirect_to events_path
    else
        redirect_to new_event_path
        flash[:notice] = 'Event could not be saved at the time.'
    end
  end

  def edit
  	@event = Event.find(params[:id])
  end


  def update
  	@event = Event.find(params[:id])
  	@event.update(event_params)
  	flash[:notice] = 'Event was successfully updated.'
  	redirect_to events_path
  end

  def destroy
  	@event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = 'Event was successfully destroyed.'
    redirect_to events_path
  end

  private

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time)
    end
end