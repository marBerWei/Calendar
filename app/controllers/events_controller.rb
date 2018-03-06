class EventsController < ApplicationController

  def index
    @events = Event.all
    @weekdays = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
    # byebug
  end


  # def show
  #   @event = Event.find(params[:id])
  # end
  def edit
  	@event = Event.find(params[:id])
  end

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
    end
  end

  def update
    respond_to do |format|
      @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
    end
  end

  def destroy
  	@event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time)
    end
end