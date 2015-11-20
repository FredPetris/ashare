class PagesController < ApplicationController
  def show
   @event = Event.find(params[:id])
    @event_coordinates = { lat: @event.lat, lng: @event.lng }
  end

  def home
    @events = Event.all.sample(3)
    @markers = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end
end
