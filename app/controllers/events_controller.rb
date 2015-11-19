class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.search(params[:search], params[:value])
    # @featured_events = Event.all.sample(6)
  end

  def show
    @occurrences = @event.occurrences
    @pictures = @event.pictures
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
     render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to :back
    else
     render :edit
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
    params.require(:event).permit(
      :label,
      :description,
      :address,
      :city,
      :phone,
      :place,
      :category,
      :participation
      ).merge(user_id: current_user.id)
  end

end
