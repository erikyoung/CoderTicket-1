class EventsController < ApplicationController

  def index
    if params[:search]
      @events = Event.where('name ILIKE ?', "%#{params[:search]}%")
    else
      @events = Event.all
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:success] = "New event created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id)
  end
end
