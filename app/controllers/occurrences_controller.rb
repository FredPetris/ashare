class OccurrencesController < ApplicationController

  before_action :find_event, only: [ :new, :create ]

  def new
    @occurrence = Occurrence.new
  end

  def create
    @occurrence = @event.occurrences.build(occurrence_params)
    if @occurrence.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @occurrence = occurrence.find(params[:id])
    @occurrence.destroy
    redirect_to event_path(@occurrence.event_id)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def occurrence_params
    params.require(:occurrence).permit(:date, :time, :event_id)
  end

end
