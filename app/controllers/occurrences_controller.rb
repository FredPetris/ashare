class OccurrencesController < ApplicationController

  before_action :find_event, only: [ :new, :create ]
  before_action :find_occurrence, only: [ :update, :destroy ]

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

  def update
    @occurrence.update(event_params)
    redirect_to :back
  end

  def destroy
    @occurrence.destroy
    redirect_to :back
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_occurrence
     @occurrence = occurrence.find(params[:id])
  end

  def occurrence_params
    params.require(:occurrence).permit(:date, :time, :event_id)
  end

end
