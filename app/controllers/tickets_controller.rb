class TicketsController < ApplicationController


  def new
    @event = Event.find(params[:event_id])
  end


 def new_ticket_type
    @ticket = @event.ticket_types.build
  end

  def create
    @ticket = @event.ticket_types.new ticket_type_params
    

    if @ticket.save
      flash[:success] = "Ticket type has been created successfully!"
      redirect_to event_path(@event)
    else
      render 'new_ticket_type'
    end
  end

  private
  def ticket_type_params
    params.require(:ticket_type).permit(:name, :event_id, :price, :max_quantity)
  end

  def get_event
    @event = Event.find(params[:event_id])
  end
end
