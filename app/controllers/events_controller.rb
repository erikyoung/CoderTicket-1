class EventsController < ApplicationController

  def index
    if params[:search]
      @events = Event.where('name ILIKE ?', "%#{params[:search]}%")
      @events = Event.where(publish: true )
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
      redirect_to events_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
    @ticket_type = TicketType.new(event: @event)
    if @event.save
     flash[:success] = "Information Updated"
    else 
    flash[:error] = "Couldn't save"
    end
  end


  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      @event.save
      flash[:success] = "Information Saved"
      redirect_to event_path
    else
      render 'new'
    end
  end

  def publish
    @event = Event.find(params[:id])
    @event.update_attributes(:publish => true)
    redirect_to events_path, notice: 'Event is published.'
  end

  def unpublish
    @event = Event.find(params[:id])
    @event.update_attributes(:publish => false)
    redirect_to events_path, notice: 'Event was unpublished!'
  end

  

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id)
  end
end
