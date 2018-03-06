class EventsController < ApplicationController

  def index
    @events = Event.all
    @start_date = params.fetch([:start_date], Date.today).to_date
    @weekdays = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
	@date_range = (@start_date.beginning_of_month.beginning_of_week..@start_date.end_of_month.end_of_week).to_a
  end


  def show
    @event = Event.find(params[:id])
  end


  def new
    @event = Event.new
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
	# / check for existing events
	# / maybe there is a way to do that with validation
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
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