class EventsController < ApplicationController

  before_action :set_event, only: [:show, :destroy]

  def index
    @events = Event.all
  end

  def show
    # @pictures = Picture.all
    # @participants = Participant.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    raise
    if @event.save
      raise
      redirect_to @event
    else
     render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:label,
                                  :description,
                                  :address,
                                  :city,
                                  :phone_number,
                                  :number,
                                  :category,
                                  :participation)
  end

end
