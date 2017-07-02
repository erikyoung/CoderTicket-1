class TicketTypesController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def create
  	@event = Event.find(params[:event_id])
  	@ticket_type = TicketType.new(ticket_type_params)
  	@ticket_type.event_id = @event.id
  	@ticket_type.save
  	if @ticket_type.save
  		flash[:success] = "New Ticket Type Created"
  		redirect_back(fallback_location: @event)
  	else
  		flash[:error] = "Unable to create ticket type"
  		redirect_back(fallback_location: @event)
  	end
  end

  private 
  def ticket_type_params
  	params.require(:ticket_type).permit(:name, :price, :max_quantity)
  end
end
