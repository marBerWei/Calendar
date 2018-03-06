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
	if @event.valid?
      	@event.save
      	# add a flash notice eventually
      	redirect_to events_path
    else
    	# add a flash notice eventually
        redirect_to new_event_path
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