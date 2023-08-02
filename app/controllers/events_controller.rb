class EventsController < ApplicationController
  before_action :authenticate_user! # If using Devise or similar for authentication
  before_action :set_group
  before_action :set_event, only: [:approve, :reject]
  include Pundit


  def new
    @group = Group.find(params[:group_id])
    @event = @group.events.new
  end

  def create
    @group = Group.find(params[:group_id])
    puts "Event Group: #{@group.name}"
    @event = @group.events.new(event_params)
    @event.user = current_user
    @event.status = :pending

    authorize @event # Check authorization before creating an event

    if @event.save
      redirect_to @group, notice: "Event was successfully created and pending approval."
    else
      puts @event.errors.full_messages # Check for any error messages in the console
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @group = @event.group

    respond_to do |format|
      format.html
      format.turbo_stream # This will handle the Turbo Stream request
    end
  end

  def approve
    authorize @event
    if @event.update(status: :approved)
      redirect_to @event.group, notice: "Event was approved and now visible to group members."
    end
  end

  def reject
    authorize @event # Check authorization before rejecting an event

    if @event.update(status: :rejected)
      @event.destroy
      redirect_to @event.group, notice: "Event was rejected."
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to @group, notice: 'Event was successfully deleted.'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end
end
