class PicturesController < ApplicationController

  before_action :find_event, only: [ :new, :create ]

  def new
    @picture = Picture.new
  end

  def create
    @picture = @event.pictures.build(picture_params)
    if @picture.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to :back
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def picture_params
    params.require(:picture).permit(:label, :image_url, :event_id)
  end

end
